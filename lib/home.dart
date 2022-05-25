import 'package:flutter/material.dart';
import 'screens/main_activity/ads_page.dart';
import 'screens/main_activity/home_page.dart';
import 'screens/main_activity/profile_page.dart';
import 'screens/main_activity/selfie_of_the_week_page.dart';
import 'screens/main_activity/whats_on_page.dart';
import 'screens/search/search.dart';
import 'screens/profile_menus/profile_menu.dart';
import 'screens/inbox/notifications.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.white,
            padding: EdgeInsets.all(8),
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Image.asset('assets/home.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/sotw.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/challenge.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/search.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/profile.png', width: 35, height: 35,),),

            ],
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
