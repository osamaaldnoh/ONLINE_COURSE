import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';
import 'package:online_course/utils/data_ar.dart';
import 'package:online_course/widgets/custom_button.dart';
import 'package:online_course/widgets/custom_image.dart';
import 'package:online_course/widgets/lessons_item.dart';
import 'package:readmore/readmore.dart';
import '../widgets/bookmark_box.dart';

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late var courseData;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    courseData = widget.data['course'];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: getFooter(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.appBgColor,
      title: Text(
        'التفاصيل',
        style: TextStyle(
          color: AppColor.textColor,
          fontFamily: 'DINNEXTLTARABIC',
        ),
      ),
      iconTheme: IconThemeData(color: AppColor.textColor),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        children: [
          Hero(
            tag: courseData['id'].toString() + courseData['image'],
            child: CustomImage(
              courseData['image'],
              radius: 10,
              width: double.infinity,
              height: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          getInfo(),
          SizedBox(
            height: 10,
          ),
          Divider(),
          getTabBar(),
          getTabBarPage(),
        ],
      ),
    );
  }

  Widget getTabBar() {
    return Container(
      child: TabBar(
        indicatorColor: AppColor.primary,
        controller: tabController,
        tabs: [
          Tab(
            child: Text(
              'الدروس',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
          ),
          Tab(
            child: Text(
              'تمارين',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabBarPage() {
    return Container(
      width: double.infinity,
      height: 230,
      child: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          getLessons(),
          Center(
            child: Text(
              'تمارين',
              style: TextStyle(
                color: AppColor.textColor,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getLessons() {
    return ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return LessonsItem(data: DataAr.lessons[index]);
        });
  }

  Widget getInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseData['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
              BookMarkBox(
                isBookMarked: courseData['is_favorited'],
                onBookMark: () {
                  setState(() {
                    courseData['is_favorited'] = !courseData['is_favorited'];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              getAttribute(Icons.play_circle_outline, courseData['session'],
                  AppColor.labelColor),
              SizedBox(
                width: 20,
              ),
              getAttribute(Icons.schedule_outlined, courseData['duration'],
                  AppColor.labelColor),
              SizedBox(
                width: 20,
              ),
              getAttribute(Icons.star, courseData['review'], AppColor.yellow),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عن الدورة',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ReadMoreText(
                courseData['description'],
                trimLines: 2,
                trimMode: TrimMode.Line,
                style: TextStyle(
                  color: AppColor.labelColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                trimCollapsedText: 'أظهر المزيد',
                moreStyle: TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
                trimExpandedText: 'أظهر أقل',
              ),
            ],
          )
        ],
      ),
    );
  }

  getAttribute(IconData iconData, String name, Color color) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: 20,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColor.labelColor,
            fontFamily: 'DINNEXTLTARABIC',
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: AppColor.shadowColor.withOpacity(.005),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 0),
        ),
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'السعر',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.labelColor,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                courseData['price'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor,
                  fontFamily: 'DINNEXTLTARABIC',
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: CustomButton(
              onTap: () {},
              title: 'اشتري الآن',
            ),
          ),
        ],
      ),
    );
  }
}
