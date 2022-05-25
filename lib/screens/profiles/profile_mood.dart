import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/main_activity/profile_page.dart';
import 'package:selphie_splash/screens/posted_items/comments_mood.dart';
import 'package:selphie_splash/screens/profiles/profile_friend.dart';
import '../../components/flexibleCard.dart';
import 'package:focused_menu/focused_menu.dart';



class ProfileMood extends StatelessWidget {
  const ProfileMood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Mood', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              MoodItem(),
              MoodItem(),
              MoodItem(),
              MoodItem(),
              MoodItem(),
              MoodItem(),
              MoodItem(),
            ],
          ),
      ),
    );
  }
}

class MoodItem extends StatelessWidget {
  const MoodItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileFriend();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage('assets/selfie.jpg'),),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileFriend();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Mood ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_mood.png', width: 18, height: 18),
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [

                          FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CommentsMood();
                            }));
                          }),
                          FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                        ],
                        blurBackgroundColor: Colors.black54,
                        openWithTap: true,
                        onPressed: (){},

                        child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Image.asset('assets/m32.png', width: 40, height: 40),
                  SizedBox(height: 10,),
                  Text("Always be Happy!", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 3),
                  SizedBox(height: 10,),
                  Text('#moodtags #moodtags #moodtags', style: TextStyle(fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic, fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 2),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsMood();
                      }));
                    },),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}

class Pallets extends StatelessWidget {
  Pallets({
    Key? key,
    required this.icon,
    required this.text,
    this.tapped
  }) : super(key: key);

  final IconData icon;
  final String text;
  VoidCallback? tapped;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Row(
        children: [
          Icon(icon, size: 35, color: Colors.grey.shade200,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade200, fontSize: 18),)
        ],
      ),
    );
  }
}