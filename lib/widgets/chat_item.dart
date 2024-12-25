import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'custom_image.dart';

class ChatItem extends StatelessWidget {
  ChatItem({Key? key, required this.data}) : super(key: key);

  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      // margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.07),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ]),
      child: ListTile(
        title: Text(
          data['name'],
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'DINNEXTLTARABIC',
            fontSize: 19,
          ),
        ),
        subtitle: Text(
          data['last_text'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'DINNEXTLTARABIC',
            color: AppColor.labelColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: CustomImage(
          data['image'],
          radius: 50,
          width: 50,
          height: 50,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data['date'].toString(),
              style: TextStyle(
                color: AppColor.labelColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                data['notify'].toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
