import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';
import 'bookmark_box.dart';

class CourceItem extends StatelessWidget {
  CourceItem({Key? key, required this.data, this.onBookMark}) : super(key: key);

  final data;
  final GestureTapCallback? onBookMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 290,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1))
          ]),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageBuilder: (contex, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: data['image'],
            ),
          ),
          Positioned(
            top: 175,
            left: 15,
            child: BookMarkBox(
              onBookMark: onBookMark,
              isBookMarked: data['is_favorited'],
            ),
          ),
          Positioned(
            top: 210,
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,fontFamily: 'DINNEXTLTARABIC',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getAttribute(Icons.sell_outlined, data['price'],
                          AppColor.labelColor),
                      getAttribute(Icons.play_circle_outline, data['session'],
                          AppColor.labelColor),
                      getAttribute(Icons.schedule_outlined, data['duration'],
                          AppColor.labelColor),
                      getAttribute(Icons.star, data['review'], AppColor.yellow),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColor.labelColor,
            fontSize: 13,fontFamily: 'DINNEXTLTARABIC',
          ),
        )
      ],
    );
  }
}
