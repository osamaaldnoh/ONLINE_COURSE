import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.data, this.onTap}) : super(key: key);

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
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
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data['price'],
                maxLines: 1,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  getAttribute(data['session'], Icons.play_circle_outline,
                      AppColor.labelColor),
                  SizedBox(
                    width: 10,
                  ),
                  getAttribute(data['duration'], Icons.schedule_outlined,
                      AppColor.labelColor),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget getAttribute(String info, IconData icon, Color color) {
  return Row(
    children: [
      Icon(
        icon,
        size: 18,
        color: color,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        info,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColor.labelColor,
          fontSize: 13,
          fontFamily: 'DINNEXTLTARABIC',
        ),
      )
    ],
  );
}
