import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';
import 'package:online_course/widgets/progress_item.dart';

import '../widgets/custom_image.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.appBgColor,
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Course',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: AppColor.appBarColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.withOpacity(.3),
                  )),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                color: AppColor.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        getTabBar(),
        getTabPage(),
      ],
    );
  }

  Widget getTabBar() {
    return Container(
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColor.primary,
        tabs: [
          Tab(
            child: Text(
              'Progress(4)',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'DINNEXTLTARABIC',
              ),
            ),
          ),
          Tab(
            child: Text(
              'Completed(8)',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 17,
                fontFamily: 'DINNEXTLTARABIC',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabPage() {
    return Expanded(
      // width: double.infinity,
      // height: 300,
      child: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          getProgress(),
          Container(
            child: Text('Progre'),
          ),
        ],
      ),
    );
  }

  Widget getProgress() {
    return ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: myProgressCourses.length,
        itemBuilder: (context, index) =>
            ProgressItem(data: myProgressCourses[index]));
  }
}
