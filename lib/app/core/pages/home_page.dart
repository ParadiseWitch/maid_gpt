import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../mixin/app_view_mixin.dart';
import '../views/chat_input.dart';
import '../views/chat_view.dart';

class HomePage extends StatelessWidget with AppPageMixin<HomePageController>{
  const HomePage({ Key? key}): super(key: key);


  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 2,
        ),
      ),
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // controller.focusNode.unfocus();
          },
          icon: const Icon(Icons.menu),
        );
      }),
      title: Text(
        controller.currentConversation?.displayName ?? '新会话',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      centerTitle: true,
      titleSpacing: 0,
      actions: [
        IconButton(
          onPressed: (){
            // controller.toConversation
          },
          icon: const Icon(
            Icons.more_horiz,
            size: 25,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }


  @override
  Widget buildBody(BuildContext context)  => const Column(
    children: [
      Expanded(
        child: ChatView(),
      ),
      ChatInput(),
    ],
  );

}

