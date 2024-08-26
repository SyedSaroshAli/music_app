import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/widgets/bottom_nav_bar.dart';

class TrendingSongPlayer extends StatefulWidget {
  final String name, artistName,imagePath,songPath;
  final int index; 
  const TrendingSongPlayer({super.key, required this.name, required this.artistName, required this.imagePath, required this.songPath, required this.index});

  @override
  State<TrendingSongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<TrendingSongPlayer> {
  int? currentIndex ;
  final AudioPlayer player = AudioPlayer();
  bool _isPlaying = false; 
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int duration){
    // return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8,'0');
    int minutes = (duration/60).toInt();
  int seconds = duration % 60;

  // Format minutes and seconds with leading zeros if necessary
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex =widget.index;
    player.onPlayerStateChanged.listen((state){
      setState(() {
        _isPlaying= state== PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration){
      setState(() {
        duration= newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition){
       setState(() {
         position=newPosition;
       });
    });
  }

  
  void playSong()async{
    if(_isPlaying==true){
      await player.pause();
      setState(() {
        _isPlaying = false;
      });
    }
    else{
      await player.play(AssetSource(trendingSongs[currentIndex!]['SongPath']));
      setState(() {
        _isPlaying= true;
      });
    }
  }


  void playNextSong(){
    if(currentIndex!<trendingSongs.length-1){
      setState(() {
        currentIndex = currentIndex!+1;
        _isPlaying = false;
      });
      playSong();
    }
    else{
      currentIndex =  0;
      playSong(); 
    }
  }

   void playPreviousSong(){
    if(currentIndex!>0){
      setState(() {
        currentIndex = currentIndex!-1;
        _isPlaying = false;
      });
      playSong();
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
        
         ),

         child: Image.asset(trendingSongs[currentIndex!]['ImagePath'],
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         fit: BoxFit.cover,),
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
           height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
           child: Padding(
             padding:  EdgeInsets.only(
              top:MediaQuery.of(context).size.height/13,
              left: 10,
              right: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNav()));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,),
                    ),
                     Text('Now Playing',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16
                     ),),
             
                     Icon(Icons.more_horiz_rounded,
                     color: Colors.white,
                     size: 30,)
                   ],
                 ),
                 Container(
                  margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height/13,
                  right: 35,left: 35),
                  height: MediaQuery.of(context).size.height/2.4,
                 width: MediaQuery.of(context).size.width/1.2,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                 ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(trendingSongs[currentIndex!]['ImagePath'],
                    fit: BoxFit.cover,),
                  ),
                         ),
                 SizedBox(height: MediaQuery.of(context).size.height/23,),
                 Text(trendingSongs[currentIndex!]['Name'],
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                 ),),

                 Text('By ${trendingSongs[currentIndex!]['Artist']}',
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontSize: 14,
                 ),),
                 
                 SizedBox(height: MediaQuery.of(context).size.height/45,),
                 Padding(
                   padding: const EdgeInsets.only(left: 17,right: 17),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position.inSeconds),
                      style: TextStyle(
                       color : Colors.grey.shade300
                      ),),
                      Text(formatTime((duration-position).inSeconds),
                       style: TextStyle(
                       color : Colors.grey.shade300
                      ),)
                    ],
                   ),
                 ),
                 Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(), 
                  onChanged: (value){
                    final newPosition = Duration(seconds: value.toInt());
                    player.seek(newPosition);
                     if (!_isPlaying) {
                        player.resume();
                      }
                  }),
          
                  Padding(
                    padding: const EdgeInsets.only(left:30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            playPreviousSong();
                          },
                          child: Icon(Icons.skip_previous_rounded,
                          color: Colors.white,
                          size: 30,),
                        ),
                    
                        GestureDetector(
                          onTap: (){
                            playSong();
                          },
                          child: _isPlaying? Icon(
                          Icons.pause,color : Colors.white,size : 50):     
                          Icon(Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 50,),
                        ),
                    
                        GestureDetector(
                          onTap: (){
                           playNextSong();
                            
                          },
                          child: Icon(Icons.skip_next_rounded,
                          color: Colors.white,
                          size: 30,),
                        ),
                      ],
                    ),
                  )         
               ],
             ),
           ),
         ),
        ]
      )
    );
  }

 
}

