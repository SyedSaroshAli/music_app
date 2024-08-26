import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_player/favourite_page.dart';
import 'package:music_player/homepage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
   int currentIndex = 0; 
  late List pages = [];

  @override
  void initState() {
    // TODO: implement initState
    HomePage();
    FavouritePage();
    pages = [HomePage(),FavouritePage()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(138, 18, 5, 39),
     bottomNavigationBar:  GNav(
       tabMargin: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
       tabBackgroundColor: Color.fromARGB(122, 72, 44, 116),
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       gap: 8,
       color: Colors.white,
       onTabChange: (index){
         setState(() {
           currentIndex = index;
         });
       },
       backgroundColor: Color.fromARGB(255, 29, 15, 68),//Color.fromARGB(174, 56, 31, 95),
       
       tabs: [
         GButton(icon: Icons.home,
         text: 'Home       ',
         textSize: 14,
         margin: EdgeInsets.only(left: 40,top: 5,bottom: 6),
         padding: EdgeInsets.all(18),
         iconColor: Colors.white,
         iconActiveColor: Colors.white,
         textColor: Colors.white),
     
         GButton(icon: Icons.favorite,
         textSize: 14,
         padding: EdgeInsets.all(18),
         margin: EdgeInsets.only(right: 40,top: 5,bottom: 6),
         iconColor: Colors.white,
         iconActiveColor: Colors.white,
         text: 'Favourites   ',
         textColor: Colors.white,
        ),

       
       ]),
      body: pages[currentIndex],
    );
  }
}