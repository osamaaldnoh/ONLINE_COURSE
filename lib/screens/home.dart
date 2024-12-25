import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/screens/course_detail.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data_ar.dart';
import 'package:online_course/widgets/categories_box.dart';
import 'package:online_course/widgets/recommend_item.dart';

import '../utils/data.dart';
import '../widgets/feature_item.dart';
import '../widgets/notification_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.appBgColor,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أسامة',
                  style: TextStyle(
                    color: AppColor.labelColor,
                    fontSize: 14,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
                Text(
                  'صباح الخير!',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
              ],
            ),
            NotificationBox(notifiedNumber: 1),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategories(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Text(
              'متميز',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.textColor,
                fontSize: 22,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
          ),
          getFeatures(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مقترحة',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                    fontSize: 22,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
                Text(
                  'اظهار الكل',
                  style: TextStyle(
                    color: AppColor.labelColor,
                    fontSize: 14,
                    fontFamily: 'DINNEXTLTARABIC',
                  ),
                ),
              ],
            ),
          ),
          getRecommends(),
        ],
      ),
    );
  }

  Widget getRecommends() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          DataAr.recommends.length,
          (index) => Container(
            padding: EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendItem(
              data: DataAr.recommends[index],
              onTap: () {
                print(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getFeatures() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
      items: List.generate(
        DataAr.features.length,
        (index) => FeatureItem(
          data: DataAr.features[index],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(
                    data: {'course': DataAr.features[index]},
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        DataAr.categories.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 15),
          child: CategoriesBox(
            data: DataAr.categories[index],
          ),
        ),
      )),
    );
  }
}
