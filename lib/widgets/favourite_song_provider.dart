import 'package:flutter/material.dart';

class FavouriteSongProvider with ChangeNotifier {
  
  List _selectedSong = [];

  List get selectedSong => _selectedSong;

 
  void remove (Map<String,dynamic> song){
     _selectedSong.removeWhere((element) => element['SongPath'] == song['SongPath']);
    notifyListeners();
  }
  

    // if(  _selectedSong.any((element) => element['SongPath'] != song['SongPath']) || _selectedSong.isEmpty){
    //   _selectedSong.add(song); 
    // }     
    // else  {_selectedSong.removeWhere((element) => element['SongPath'] == song['SongPath']);}
    //    //  _selectedSong.add(song);   
    // notifyListeners();
     void add(Map<String, dynamic> song) {
    // Check if the song is already in the list
    if (isFavorite(song)) {
      // Remove if already a favorite
      remove(song);
    } else {
      // Add if not a favorite
      _selectedSong.add(song);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> song) {
    if(  _selectedSong.any((element) => element['SongPath'] == song['SongPath'])){
      return true ;  
    };
    return false ;
  }
  void clearFavourites(){
    _selectedSong=[];
    notifyListeners();
  }
}