import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class BookMarkBox extends StatelessWidget {
  BookMarkBox({Key? key, this.onBookMark, this.isBookMarked = false})
      : super(key: key);
  final GestureTapCallback? onBookMark;
  final bool isBookMarked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBookMark,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: isBookMarked ? AppColor.primary : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: AppColor.shadowColor.withOpacity(.05),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: Offset(1, 1))
            ]),
        child: SvgPicture.asset(
          'assets/icons/bookmark.svg',
          color: isBookMarked ? Colors.white : AppColor.primary,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
