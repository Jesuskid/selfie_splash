import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/screens/posted_items/reacts.dart';
import '../main_activity/home_page.dart';
import '../main_activity/profile_page.dart';
import 'package:selphie_splash/constants.dart';
import '../posted_items/tags.dart';
import '../profiles/profile_friend.dart';

class CommentsSelfie extends StatelessWidget {
  const CommentsSelfie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('Alice Stark\'s selfie', style: kOnboardTextBig.copyWith(color: Colors.black,
            fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Expanded(
          child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommentSelfieItem(),
                    Comment(),
                    Comment(),
                    Comment(),
                  ],
                ),
          ),
        )
      ),

      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical:10),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.grey))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Add comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 1, color: Colors.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),

              IconButton(onPressed: (){showDialog(context: context, builder: CommentMoodModal);},
                  icon: Icon(Icons.mood, color: Colors.grey, size: 32)),
              IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.grey, size: 32)),
            ],
          ),
        ),
      )
    );
  }
}


class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5),
        child: ContainerCard(
          child: Row(
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
                    child: CircleAvatar(radius: 25,backgroundImage: AssetImage('assets/selfie1.jpeg')),
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProfileFriend();
                          }));
                        },
                        child: Text('Mari Flake🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Smile :)', overflow: TextOverflow.ellipsis, maxLines: 4,)
                    ],
                  )
                ],
              ),
              Image.asset('assets/m1.png', width: 50, height: 50,),

            ],
          ),),),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('1h', textAlign: TextAlign.center,),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: ReactionModal);
                    },
                    child: Icon(Icons.favorite, color: Colors.grey, size: 30,)),
                SizedBox(width: 10,),
                Text('3'),
                SizedBox(width: 10,),
                GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Reacts();
                        }));
                      },
                      child: Container(
                          child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 30,),
                          Positioned (left:12, top: 5,  child: Icon(Icons.favorite, color: Colors.blue, size: 30,),),
                          Positioned(left:25, top: 9,  child: Icon(Icons.favorite, color: Colors.green, size: 30,),),
                        ],
                      ))),
              ],
            ),
            Text('Reply', textAlign: TextAlign.center,),

          ],
        ),
        SizedBox(height: 20,),
        Text('View all replies', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(radius: 18,backgroundImage: AssetImage('assets/selfie.jpg')),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text('Emily Lina🇳🇮',overflow: TextOverflow.ellipsis, maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                  Text('I have a thought on this though.',overflow: TextOverflow.ellipsis, maxLines: 1,
                    style: TextStyle(fontSize: 12),)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 4,
                color: Colors.grey.withOpacity(0.3))
          ]),
    );
  }
}


//widgets
class CommentSelfieItem extends StatelessWidget {
  const CommentSelfieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:10),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfilePage();
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
                                    return ProfilePage();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
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
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                              Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                              fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 4,),
                          SizedBox(height: 10,),
                          Text('#hashtags #hashtags #hashtags', style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic, fontSize: 16, color: Colors.blue),
                            overflow: TextOverflow.ellipsis, maxLines: 2,),
                        ],
                      )
                  ),),
                SizedBox(height: 10,),
                //Image
                Image.asset('assets/selfie.jpg'),
                Container(
                  height: 55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          Pallets(icon: Icons.favorite_border, text: '1k',),
                          Pallets(icon: Icons.comment, text: '43',),
                          Pallets(icon: Icons.account_circle_rounded, text: '10', tapped: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Tags();
                            }));
                          },),
                          Pallets(icon: Icons.share, text: '4',),
                    ],
                  ),
                ),

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
          Icon(icon, size: 35, color: Colors.grey.shade600,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 18),)
        ],
      ),
    );
  }
}

Widget ReactionModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 60,),
                        Text('Lovely!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.blue, size: 60,),
                        Text('Cool!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.green, size: 60,),
                        Text('Refreshing!',),
                      ],
                    )),
              ],
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.purple, size: 60,),
                        Text('Classy!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.brown, size: 60,),
                        Text('Oh please!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.black, size: 60,),
                        Text('Dark!',),
                      ],
                    )),
              ],
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.pink, size: 60,),
                        Text('Cute!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.orange, size: 60,),
                        Text('Warm!',),
                      ],
                    )),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Icon(Icons.favorite, color: Colors.blueGrey, size: 60,),
                        Text('Cold!',),
                      ],
                    ))
              ],
            ),
          ],
        ),
      )
    ),
);

Widget CommentMoodModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m1.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m2.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m3.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m4.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m5.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m6.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m7.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m8.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m9.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m10.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m11.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m12.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m13.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m14.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m15.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m16.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m17.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m18.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m19.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m20.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m21.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m22.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m23.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m24.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m25.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m26.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m27.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m28.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m29.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m30.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m31.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m32.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m33.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m34.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m35.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m36.png', width: 50, height: 50,),),
              ],),
          ],
        ),
      )
  ),
);