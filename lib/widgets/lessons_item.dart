import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'custom_image.dart';

class LessonsItem extends StatelessWidget {
  LessonsItem({Key? key, required this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.07),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImage(
            data['image'],
            radius: 10,
            width: 70,
            height: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      color: AppColor.labelColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data['duration'],
                      style: TextStyle(
                        color: AppColor.labelColor,
                        fontSize: 13,
                        fontFamily: 'DINNEXTLTARABIC',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.labelColor,
            size: 15,
          )
        ],
      ),
    );
  }
}
