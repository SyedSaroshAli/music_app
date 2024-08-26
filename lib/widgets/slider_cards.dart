import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/trending_song_page.dart';

class SliderCards extends StatelessWidget {
  final String name,imageUrl,author,songPath;
  final int index;
  const SliderCards({super.key, required this.name, required this.imageUrl, required this.author, required this.songPath, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TrendingSongPlayer(
        name: name, 
        artistName: author, 
        imagePath: imageUrl, 
        songPath: songPath,
        index: index,)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Stack(
          children: [
            Container(
              
            height: MediaQuery.of(context).size.height/4.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageUrl,
              fit: BoxFit.fill,),
            ),
          ),
           Container(
            height:  MediaQuery.of(context).size.height/4.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: const Color.fromARGB(96, 39, 31, 31),
              borderRadius: BorderRadius.circular(12)
            ),
            
          ),
      
          Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [Colors.transparent,Colors.black38,Colors.black54]
              ,begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/7.5,
                left: 20,
                right: 20,
                bottom: 8),
              child: 
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                   children: [
                    SizedBox(height: 9,),
                    Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(author,
                      style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 13,
                      
                    ),
                    )
                   ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}