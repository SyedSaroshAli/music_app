import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:music_player/models/songs.dart';
import 'package:music_player/search_song_page.dart';
import 'package:music_player/widgets/slider_cards.dart';
import 'package:music_player/widgets/song_tiles.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   int currentIndex = 0; 


  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: 
         const Color.fromARGB(209, 29, 15, 68),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             Padding(
               padding:  EdgeInsets.only(
                top: MediaQuery.of(context).size.height/10),
               child:const  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Icon(Icons.music_note,
                  color: Colors.white,
                  size: 50,)
                 
                 ],
               ),
             ),
          
            
            const SizedBox(height: 35,),
             Divider(
              color: Colors.grey.shade800,
              thickness: 2,
            ),
            const  SizedBox(height: 10,),
          const ListTile(
              leading: Icon(Icons.account_circle,
              color: Colors.white,
              size: 30,),
              title: Text('P R O F I L E',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                
              ),),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              leading: Icon(Icons.settings,
              color: Colors.white,
              size: 30,),
              title: Text('S E T T I N G S',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                
              ),),
            ),
          ],
        ),
      ),
     
     body: Stack(
      children: [

         Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         decoration: const BoxDecoration(
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
           padding: EdgeInsets.only(
           top: MediaQuery.of(context).size.height/13),
           height: double.infinity,
           width: double.infinity,
           child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:14,right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                         _scaffoldKey.currentState?.openDrawer();
                      },
                      child:const  Icon(Icons.menu_rounded,
                      color: Colors.white,),
                    ),
                           
                   const  Text('P L A Y L I S T',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),),
                           
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchSong()));
                      },
                      child: const Icon(Icons.search_rounded,
                      color: Colors.white,),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
      
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   const SizedBox(height: 15),
                  const  Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: Text('Trending',
                     style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                     ),),
                   ),
                   const SizedBox(height: 15),
                   CarouselSlider.builder(itemCount: trendingSongs.length, itemBuilder: (context,index,realIndex){
                              return SliderCards(name: trendingSongs[index]['Name'], imageUrl: trendingSongs[index]['ImagePath'], author: trendingSongs[index]['Artist'],songPath: trendingSongs[index]['SongPath'],index: index,);
                            }, options: CarouselOptions(
                             
                              viewportFraction: 0.98,
                              height: MediaQuery.of(context).size.height/4.5,
                              autoPlay: true,
                             // enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              
                            )),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('For You',
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                         ),),
                   
                  
                    const SizedBox(height: 10),
                      for(int i=0;i<playlist.length;i++)
                          SongTiles(
                          name: playlist[i]['Name'],
                          imagePath: playlist[i]['ImagePath'], 
                          artistName:playlist[i]['Artist'], 
                          songPath: playlist[i]['SongPath'],
                          index: i,
                             
                    )]),),
                   const SizedBox(height: 50,)
                   ]   ),
                ),
              )
               
                  
            ],
                   
                ),
         ),
       
      
     ],
     ),
    
    );
  }
}