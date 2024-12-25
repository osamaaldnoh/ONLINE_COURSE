import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'custom_image.dart';

class ProgressItem extends StatelessWidget {
  ProgressItem({Key? key, required this.data}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['completed'],
                      style: TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'DINNEXTLTARABIC',
                      ),
                    ),
                    Text(
                      data['progress'],
                      style: TextStyle(
                        color: AppColor.labelColor,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'DINNEXTLTARABIC',
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: data['complete_percent'],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
