import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/main_activity/profile_page.dart';
import '../../components/flexibleCard.dart';
import 'package:focused_menu/focused_menu.dart';



class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('My Notifications', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              NotificationItem(
                text: 'Alice Stark, Su Lin and 25 others admired your selfie',
                icon: Icons.favorite,
                time: '10m',
                iconColor: Colors.red,
              ),
              NotificationItem(
                text: 'Alice Stark, Su Lin and 25 others commented your selfie',
                icon: Icons.comment,
                time: '10m',
                iconColor: Colors.amber,
              ),
              NotificationItem(
                text: 'Alice Stark, Su Lin and 5 others shared your meme.',
                icon: Icons.share,
                time: '10m',
                iconColor: Colors.green,
              ),
              NotificationItem(
                text: 'Sessi Nam accepted your request as bestie.',
                icon: Icons.check_circle,
                time: '10m',
                iconColor: Colors.blue,
              ),
              NotificationItem(
                text: 'Adjei Annan viewed your svlog.',
                icon: Icons.remove_red_eye,
                time: '10m',
                iconColor: Colors.black,
              ),
              NotificationItem(
                text: 'Ben North\s birthday is today. Send your wishes!',
                icon: Icons.cake,
                time: '10m',
                iconColor: Colors.purple,
              ),
              NotificationItem(
                text: 'Uriel reacted to your comment.',
                icon: Icons.favorite,
                time: '10m',
                iconColor: Colors.brown,
              ),
              NotificationItem(
                text: 'Alibe Forn requested to follow you as friend.',
                icon: Icons.person_add,
                time: '10m',
                iconColor: Colors.blue,
              ),
            ],
          ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.text,
    required this.time,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  final String text, time;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.6,
      menuOffset: 10,
      menuItemExtent: 50,
      blurSize: 0,
      menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

      menuItems: [

        FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){}),
        FocusedMenuItem(title: Text('Remove notification', style: TextStyle(fontSize: 14),), onPressed:(){}),
        FocusedMenuItem(title:Text('Turn off related notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
        FocusedMenuItem(title: Text('Return', style: TextStyle(fontSize: 14),), onPressed:(){}),

      ],
      blurBackgroundColor: Colors.black54,
      openWithTap: true,
      onPressed: (){},

      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: ContainerCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),
                      ),
                      SizedBox(width: 5,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(height: 5,),
                          Text(time, style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                      ),
                    ],
                  ),
                  ),
                      SizedBox(width: 5,),
                      Icon(icon, size: 30, color: iconColor,),
                ],
              )),
        )
      ),
    );
  }
}
