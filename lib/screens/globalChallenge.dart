import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'challenge.dart';
import 'addChallenge.dart';

class GlobalChallenge extends StatelessWidget {
  const GlobalChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = ['🇺🇸', '🇦🇫', '🇦🇽', '🇨🇩', '🇬🇬', '🇬🇭', '🇳🇬', '🇳🇮'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87,),),
        title: Text('View Global', style: kOnboardTextBig.copyWith(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          Image.asset('assets/search1.png', width: 35, height: 35,)
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  // TextButton(onPressed: (){
                  //   FirebaseAuth.instance.signOut();
                  // }, child: Text('Log Out')),
                  SizedBox(height: 20,),
                  Center(child: Text('View, Join and Enjoy fun challenges in your SelfieSplash world', textAlign: TextAlign.center, style: kOnboardTextSmall.copyWith(color: Colors.black87, fontSize: 18, wordSpacing: 0.5),)),
                  SizedBox(height: 10,),
                  Image.asset('assets/challenge_trophy.png', scale: 1.5,),
                  SizedBox(height: 20,),

                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 1,
                        crossAxisCount: 2,
                      ),

                      itemBuilder: (BuildContext context, index){
                        return Stories(title: items[index]);
                      },
                      itemCount: items.length,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class Stories extends StatelessWidget {
  Stories({
    Key? key,
    required this.title
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Challenge(
              name: 'Name',
              desc: 'Take a seplhie with our fav mask',
              tags: '#challengefiesta',
              image: '',
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.all(4),
          width: 200,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.grey.withOpacity(0.2)
                ),

              ]
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  height: 70,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mask Up Challenge', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                      Text('Take a selfie with your fav mask', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Row(
                        children: [
                          Text('24K', style: TextStyle(color: Colors.white),),
                          SizedBox(width: 75,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('2h', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0), bottomRight:Radius.circular(20), bottomLeft: Radius.circular(20)),
                  ),

                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                    child: Column(
                      children: [
                        Text(title),
                        Icon(Icons.star, color: Colors.yellow,),
                      ],
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}
