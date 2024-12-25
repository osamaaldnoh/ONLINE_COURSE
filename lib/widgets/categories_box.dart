import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class CategoriesBox extends StatelessWidget {
  CategoriesBox({Key? key, required this.data}) : super(key: key);

  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SvgPicture.asset(
            data['icon'],
            width: 30,
            height: 30,
            color: AppColor.textColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          data['name'],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'DINNEXTLTARABIC',
          ),
        ),
      ],
    );
  }
}
