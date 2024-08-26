import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/homepage.dart';
import 'package:music_player/search_song_page.dart';
import 'package:music_player/widgets/favourite_song_provider.dart';
import 'package:music_player/widgets/song_tiles2.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int currentIndex = 1; 
  late List pages = [];
  

  @override
  void initState() {
    HomePage();
    FavouritePage();
    pages=[HomePage(),FavouritePage()];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteSongProvider>(context);
    
    return Scaffold(
      body: Stack(
      children: [

         Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           gradient: LinearGradient(
            colors: [Color.fromARGB(255, 159, 37, 184),Color.fromARGB(255, 42, 33, 85),Color.fromARGB(255, 8, 26, 77),Color.fromARGB(255, 38, 38, 41),Color.fromARGB(255, 32, 24, 150)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
         ),
        ),

        BackdropFilter(filter: ImageFilter.blur(
          sigmaX: 14,
          sigmaY: 14
        ),
        child: Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
        ),),

        Container(
          
          height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         color: Colors.black38,
        ),
         Container(
           padding: EdgeInsets.only(left: 20,right: 20,
           top: MediaQuery.of(context).size.height/13),
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu_rounded,
                  color: Colors.white,),

                  Text('F A V O U R I T E S',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchSong()));
                    },
                    child: Icon(Icons.search_rounded,
                    color: Colors.white,),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.0000001,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: favouriteProvider.selectedSong.length,
                  itemBuilder: (context,index){
                    
                    return SongTiles2(
                      name: favouriteProvider.selectedSong[index]['Name'],
                      imagePath: favouriteProvider.selectedSong[index]['Image'], 
                      artistName:favouriteProvider.selectedSong[index]['Artist'], 
                      songPath: favouriteProvider.selectedSong[index]['SongPath'],
                      index: index,);
                  })),
            ],
                   
                ),
         ),
       
      //  Positioned(
    
      //   bottom: 30,left: 40,right: 40,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(34),
      //     child: GNav(
      //       selectedIndex: 1,
      //       tabBackgroundColor: Color.fromARGB(173, 72, 44, 116),
      //       gap: 10,
      //       color: Colors.white,
      //       onTabChange: (index){
      //        currentIndex = index;
      //             if(currentIndex==0){
      //            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()
      //            ));
      //             }
             
      //       },
      //       backgroundColor: Color.fromARGB(174, 56, 31, 95),
      //       tabs: [
      //         GButton(icon: Icons.home,
      //         text: 'Home       ',
      //         iconColor: Colors.white,
      //         iconActiveColor: Colors.white,
      //         textColor: Colors.white),
          
      //         GButton(icon: Icons.favorite,
      //         iconColor: Colors.white,
      //         iconActiveColor: Colors.white,
      //         text: 'Favourites',
      //         textColor: Colors.white,
      //        )
      //       ]),
      //   ),
      // )
     ],
     ),
    
    );
  }
}