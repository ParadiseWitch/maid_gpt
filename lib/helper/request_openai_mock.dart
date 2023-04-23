import 'dart:async';

Future getMock(
  String message, {
  required String host,
  required String apiKey,
  Function? onListen,
  Function? onDone,
}) async {
  Completer completer = Completer();

  // var exception = Exception('error!!');
  // completer.completeError(exception);

  for (var i = 0; i < 10; i++) {
    onListen!(i.toString());
    await Future.delayed(const Duration(seconds: 1));
  }

  completer.complete({'content': "succ"});
  return completer.future;
}
