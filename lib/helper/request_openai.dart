import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  String resContent = '';
  get(
    // '写篇小说',
    '讲个笑话',
    // TODO 提交前删除apikey
    host: 'openai.maiiiiiid.asia',
    apiKey: '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',
    onListen: (String data) {
      resContent += data;
      print(resContent);
    },
  ).then((ret) {
    print('===========================');
    print(ret['status']);
    print(ret['content']);
  }).catchError((ret) {
    print('===========================');
    print(ret['status'] ?? '');
    print(ret['content'] ?? '');
  });
}

Future get(
  String message, {
  required String host,
  required String apiKey,
  Function? onListen,
  Function? onDone,
}) async {
  // 返回值是否是错误信息
  bool isError = false;
  // 不完整的返回数据存放在这个list
  List<String> incompleteList = [];
  // 存储全部的返回数据
  StringBuffer allResString = StringBuffer();

  Completer completer = Completer();

  // 处理分段好的data，并返回content
  String handleDataStringAndGetContent(String dataString) {
    if (dataString.contains('[DONE]')) {
      return '';
    }

    Map dataMap;
    try {
      String tidyString = dataString.substring(5, dataString.length).trim();
      dataMap = json.decode(tidyString);
    } catch (e) {
      incompleteList.add(dataString);
      return '';
    }

    String content = dataMap['choices']?[0]?['delta']?['content'] ?? '';
    return content;
  }

  void listening(String data) {
    allResString.write(data);

    // 如果返回的是错误信息，不处理，留给onDone处理
    if (isError) return;
    // 如果返回的是错误信息，不处理，留给onDone处理
    if (data.contains('error') && !data.contains('\n\n')) {
      isError = true;
      return;
    }

    // if (incompleteList.isEmpty) {
    //   // 处理正常返回内容
    //   String content = handleDataStringAndGetContent(data);
    //   if (onListen != null) {
    //     onListen(content);
    //   }
    // } else {
    String incompleteString = incompleteList.join('') + data;
    incompleteList = [];
    List<String> templist = incompleteString
        .trim()
        .split('\n\n')
        .where((str) => str.trim().isNotEmpty)
        .toList();
    for (var i = 0; i < templist.length; i++) {
      String dataString = templist[i];

      String content = handleDataStringAndGetContent(dataString);
      if (onListen != null) {
        onListen(content);
      }
    }
    // }
  }

  void done() {
    var responseString = allResString.toString();

    if (isError) {
      Map errorMap = json.decode(responseString);
      completer.completeError({
        'status': 'error',
        'content': errorMap['error']?['message'] ?? 'can\'t get msg',
      });
    } else {
      List<String> contentList = responseString
          .trim()
          .split('\n\n')
          .where((s) => s.trim().isNotEmpty)
          .map<String>((s) {
        if (s.contains('[DONE]')) {
          return '';
        }
        String tidyString = s.substring(5, s.length).trim();
        Map resultMap = json.decode(tidyString);
        return resultMap['choices']?[0]?['delta']?['content'] ?? '';
      }).toList();

      String content = contentList.join('');
      completer.complete({
        'status': 'succ',
        'content': content,
      });
    }
  }

  try {
    var httpClient = HttpClient();
    var uri = Uri.https(host, '/v1/chat/completions');
    var request = await httpClient.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $apiKey');
    request.write(json.encode({
      'model': 'gpt-3.5-turbo',
      'stream': true,
      'messages': [
        {'role': 'user', 'content': message}
      ],
      'max_tokens': 340,
    }));

    var response = await request.close();

    response.transform(utf8.decoder).listen(listening, onDone: done);
  } catch (e) {
    completer.completeError(e);
  }

  return completer.future;
}
