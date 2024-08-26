import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/widgets/bottom_nav_bar.dart';
import 'package:music_player/widgets/song_tiles.dart';

class SearchSong extends StatefulWidget {
  const SearchSong({super.key});

  @override
  State<SearchSong> createState() => _SearchSongState();
}

class _SearchSongState extends State<SearchSong> {
  final controller = TextEditingController();

  List foundSong = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundSong = allSongs;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,
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
           child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNav()));
                },
                child: Icon(Icons.arrow_back_ios_rounded,
                color: Colors.white,),
              ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('S E A R C H',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                    
                  ),),
                ],
              )
            ],
          ),
            
          SizedBox(height: MediaQuery.of(context).size.height/25,),
          TextField(
            style: TextStyle(
              color: Colors.white
            ),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 171, 59, 199)
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey.shade700
                )
              ),
              hintText: 'Search Song',
              hintStyle: TextStyle(
                color: Colors.grey.shade500
              ),
              suffixIcon: Icon(Icons.search,
              color: Colors.grey.shade500,),
            ),
            onChanged: (value){
              searchSong(value);
            },
          ),
          //SizedBox(height: MediaQuery.of(context).size.height*0.00001,),
          Expanded(
            child: ListView.builder(
              itemCount: foundSong.length,
              itemBuilder: (context,index){
                final song = foundSong[index];
                
                return SongTiles(
                  name: song['Name'],
                  imagePath: song['ImagePath'], 
                  artistName: song['Artist'], 
                  songPath: song['SongPath'],
                  index: index,);
              }))
        ],
      ),
         ),

     ],
     
      ),
    );
   
  }
     void searchSong(String querry){
      List results = [];
      if(querry.isEmpty){
         results = allSongs;
      }
      else{
        results = allSongs.where((song)=> song['Name'].toLowerCase().contains(querry.toLowerCase())).toList();
      }
      setState(() {
        foundSong = results;
      });
      }
}