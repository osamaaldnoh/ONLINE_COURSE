import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';
import 'package:online_course/utils/data_ar.dart';
import 'package:online_course/widgets/category_item.dart';

import '../widgets/course_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: getSearchBox(),
          ),
          SliverToBoxAdapter(
            child: getCategories(),
          ),
          SliverList(delegate: getCourses()),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        children: [
          Text(
            'يستكشف',
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'DINNEXTLTARABIC',
            ),
          )
        ],
      ),
    );
  }

  Widget getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    hintText: 'بحث',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'DINNEXTLTARABIC',
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;

  Widget getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 5),
      child: Row(
        children: List.generate(
          DataAr.categories.length,
          (index) => CategoryItem(
            isActive: selectedCategoryIndex == index,
            data: DataAr.categories[index],
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  getCourses() {
    return SliverChildBuilderDelegate(childCount: DataAr.courses.length,
        (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
        child: CourceItem(
          data: DataAr.courses[index],
          onBookMark: () {
            setState(() {
              DataAr.courses[index]['is_favorited'] =
                  !DataAr.courses[index]['is_favorited'];
            });
          },
        ),
      );
    });
  }
}
