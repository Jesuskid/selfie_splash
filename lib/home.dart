import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/main_activity/ads_page.dart';
import 'screens/main_activity/home_page.dart';
import 'screens/main_activity/profile_page.dart';
import 'screens/main_activity/selfie_of_the_week_page.dart';
import 'screens/main_activity/whats_on_page.dart';
import 'screens/search/search.dart';
import 'screens/profile_menus/profile_menu.dart';
import 'screens/inbox/notifications.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(bottom: false,
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide( color: Colors.grey, width: 0.5)),
            ),
            child: TabBar(
                labelColor: Colors.blue,
                padding: EdgeInsets.all(3),
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: MaterialIndicator(
                  height: 3,
                  color: Colors.blue,
                  topLeftRadius: 25,
                  topRightRadius: 25,
                  tabPosition: TabPosition.bottom,
                ),
                tabs: [
                  Tab(icon: Icon(Icons.home, size: 30),),
                  Tab(icon: Icon(Icons.favorite, size: 30),),
                  Tab(icon: Icon(Icons.star, size: 30),),
                  Tab(icon: Icon(Icons.search, size: 30),),
                  Tab(icon: Icon(Icons.person, size: 30),),

                ],
              ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SelfieOfTheWeekPage(),
              WhatsOnPage(),
              AdsPage(),
              ProfilePage()

            ],
          ),
        ),
      ),
    );
  }
}
