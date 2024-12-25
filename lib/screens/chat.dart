import 'package:flutter/material.dart';
import 'package:online_course/widgets/chat_item.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/custom_image.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: getAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              getSearch(),
              SizedBox(
                height: 10,
              ),
              getDataChat(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: AppColor.appBarColor,
      elevation: 0,
      title: Container(
        child: Row(
          children: [
            Text(
              'Chat',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSearch() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(bottom: 3),
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 0),
            ),
          ]),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontFamily: 'DINNEXTLTARABIC',
            )),
      ),
    );
  }

  getDataChat() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          chats.length,
          (index) => Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: 8),
            child: ChatItem(data: chats[index]),
          ),
        ),
      ),
    );
  }
}
