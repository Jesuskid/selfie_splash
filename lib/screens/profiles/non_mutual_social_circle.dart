import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/profiles/profile_friend.dart';
import 'package:selphie_splash/screens/profiles/profile_user.dart';
import '../../../components/popContext.dart';


class NonMutualSocialCircle extends StatefulWidget {
  @override
  NonMutualSocialCircleState createState() => NonMutualSocialCircleState();
}

class NonMutualSocialCircleState extends State<NonMutualSocialCircle> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,
                  color: Colors.black,)),
                elevation: 0,
                titleSpacing: 0,
                title: Text('Social Circle', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
                toolbarHeight: 70,
                bottom: const  TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  tabs: [
                    Tab(text: '123K followers',),
                    Tab(text: '222 following',),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
              children: [
                // first tab bar view widget
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchInput(hint: 'followers', changed: (value){},),
                      Container(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: [
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // second tab bar view widget
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchInput(hint: 'following', changed: (value){},),
                      Container(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: [
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollowing(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  SearchInput({
    Key? key,
    required this.hint,
    required this.changed
  }) : super(key: key);
  String hint;
  ValueChanged changed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            Icon(Icons.search,  color: Colors.black,),
            SizedBox(width: 10,),
            Expanded(
                child: TextField(
                  onChanged: changed,
                  style: TextStyle(color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search $hint',
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),

                  ),
                ),)

          ],
        ),

    );
  }
}

// Follower of only my friends that I am not following
class ItemFollower extends StatelessWidget {
  const ItemFollower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileUser();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileUser();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
                        Text('Welcome to my humble page.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                SizedBox(width: 3,),
                ElevatedButton(onPressed: (){showDialog(context: context, builder: FollowModal);},
                  child: Text('Follow'),
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                  ),
                ),

              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}

//Followers of my friends and I that I am not following
class ItemFollower1 extends StatelessWidget {
  const ItemFollower1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileUser();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileUser();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
                        Text('Welcome to my humble pa gg gg gg.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                SizedBox(width: 3,),
                ElevatedButton(onPressed: (){showDialog(context: context, builder: AcceptModal);},
                  child: Text('Accept As?'),
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}

// Followers of my friends and I that we are both following
class ItemFollowing extends StatelessWidget {
  const ItemFollowing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileFriend();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileFriend();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
                        Text('Welcome to my humble page ggg ggg.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                SizedBox(width: 3,),
                ElevatedButton(onPressed: (){showDialog(context: context, builder: ChangeStatusModal);},
                  child: Text('Following', style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      primary: Colors.white,
                      side: BorderSide(color: Colors.grey, width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}

Widget FollowModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Follow Me As?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40,),
                SizedBox(width: 5,),
                Text('Lover', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 40,),
                SizedBox(width: 5,),
                Text('Family', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 40,),
                SizedBox(width: 5,),
                Text('Bestie', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 40,),
                SizedBox(width: 5,),
                Text('Friend', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
          ],
        ),
      )
  ),
);

Widget AcceptModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Accept Me As?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40,),
                SizedBox(width: 5,),
                Text('Lover', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 40,),
                SizedBox(width: 5,),
                Text('Family', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 40,),
                SizedBox(width: 5,),
                Text('Bestie', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 40,),
                SizedBox(width: 5,),
                Text('Friend', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
          ],
        ),
      )
  ),
);

Widget ChangeStatusModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 370,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Change Status To?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40,),
                SizedBox(width: 5,),
                Text('Lover', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 40,),
                SizedBox(width: 5,),
                Text('Family', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 40,),
                SizedBox(width: 5,),
                Text('Bestie', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 40,),
                SizedBox(width: 5,),
                Text('Friend', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.block, color: Colors.black, size: 40,),
                SizedBox(width: 5,),
                Text('Unfollow', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
          ],
        ),
      )
  ),
);
