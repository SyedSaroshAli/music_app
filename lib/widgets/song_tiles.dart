// import 'package:flutter/material.dart';
// import 'package:music_player/song_page.dart';
// import 'package:music_player/widgets/favourite_song_provider.dart';
// import 'package:provider/provider.dart';

// class SongTiles extends StatefulWidget {
//   final String name,imagePath,artistName,songPath;
//   final int index;
//   const SongTiles({super.key, required this.name, required this.imagePath, required this.artistName, required this.songPath, required this.index});

//   @override
//   State<SongTiles> createState() => _SongTilesState();
// }

// class _SongTilesState extends State<SongTiles> {
//    bool isSelected = false ; 
//   @override
//   Widget build(BuildContext context) { 
   
//     return Consumer<FavouriteSongProvider>(builder: (context,value,child){
//       return GestureDetector(
//      onTap: (){
//       Navigator.push(context, MaterialPageRoute(
//         builder: (context)=> SongPlayer(
//           name: widget.name, 
//           artistName: widget.artistName, 
//           imagePath: widget.imagePath, 
//           songPath: widget.songPath)));
//      },
//      child: Container(
//         margin: EdgeInsets.only(bottom: 3),
//         padding: EdgeInsets.only(left: 6,right: 6,bottom: 4),
//         width: MediaQuery.of(context).size.width,
//         height: 70,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//        //   color: Color.fromARGB(59, 48, 0, 71),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(widget.imagePath,
//                   height: 50,
//                   width: 50,
//                   fit: BoxFit.cover,),
//                   ),
                     
//                   SizedBox(width: 10,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(widget.name,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                        // fontWeight: FontWeight.bold
//                       ),),
                     
//                        Text(widget.artistName,
//                       style: TextStyle(
//                         color: Colors.grey.shade500,
//                         fontSize: 13,
//                        // fontWeight: FontWeight.bold
//                       ),)
//                     ],
//                   ),
//               ],
//             ),

          
//             GestureDetector(
//               onTap: (){
//                 value.addOrRemove(
//                   {
//                    'Name': widget.name,
//                    'Artist': widget.artistName,
//                    'Image' : widget.imagePath,
//                    'SongPath': widget.songPath,
//                   }
//                 );
//               //   if(value.selectedSong.contains({
//               //     'Name': widget.name,
//               //     'Artist': widget.artistName,
//               //     'Image': widget.imagePath,
//               //     'SongPath': widget.songPath,
//               //   })){
//               //        value.removeSong(
//               //     {
//               //       'Name': widget.name,
//               //       'Artist': widget.artistName,
//               //       'Image': widget.imagePath,
//               //       'SongPath': widget.songPath,
//               //     });
//               //   }
//               //   else{
//               //      value.addSong(
//               //     {
//               //       'Name': widget.name,
//               //       'Artist': widget.artistName,
//               //       'Image': widget.imagePath,
//               //       'SongPath': widget.songPath,
//               //     }
//               //    );
//               //   }
//               // },
//               },
//               child: 
            
//               Icon(value.selectedSong.contains(widget.index)?
//                 Icons.favorite
//              :
//                 Icons.favorite_border_outlined,),
//             ),
//           ],
//         ),
//       ),
//    );
//     });  
 
//   }
// }


import 'package:flutter/material.dart';
import 'package:music_player/song_page.dart';
import 'package:music_player/widgets/favourite_song_provider.dart';
import 'package:provider/provider.dart';

class SongTiles extends StatelessWidget {
  final String name, imagePath, artistName, songPath;
  final int index;

   SongTiles({
    super.key,
    required this.name,
    required this.imagePath,
    required this.artistName,
    required this.songPath,
    required this.index,
  });

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteSongProvider>(builder: (context, value, child) {
      final songData = {
        'Name': name,
        'Artist': artistName,
        'Image': imagePath,
        'SongPath': songPath,
      };

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongPlayer(
                name: name,
                artistName: artistName,
                imagePath: imagePath,
                songPath: songPath,
                index: index,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 3),
          padding: const EdgeInsets.only(left: 6, right: 6, bottom: 4),
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        artistName,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  
                     // Toggle favorite status for the specific song
                 value.add(songData);
                },
                child: Icon(
                  value.isFavorite(songData)? Icons.favorite : Icons.favorite_border_outlined,
                  color: value.isFavorite(songData)? Colors.red : Colors.grey.shade500,
                     
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
