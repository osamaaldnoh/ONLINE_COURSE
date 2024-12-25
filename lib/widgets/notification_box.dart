import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

import '../theme/color.dart';

class NotificationBox extends StatelessWidget {
  NotificationBox({Key? key, this.notifiedNumber = 0}) : super(key: key);

  final int notifiedNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(
            color: Colors.grey.withOpacity(.3),
          )),
      child: notifiedNumber > 0
          ? badges.Badge(
              position: badges.BadgePosition.custom(top: -7, end: 0),
              badgeContent: Text(''),
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColor.primary,
                padding: EdgeInsets.all(3),
              ),
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                color: Colors.black,
                width: 20,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              'assets/icons/bell.svg',
              color: Colors.black,
              width: 20,
              height: 20,
            ),
    );
  }
}
