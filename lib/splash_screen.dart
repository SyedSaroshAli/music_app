import 'package:flutter/material.dart';
import 'package:music_player/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
 void initState() {
   Future.delayed(const Duration(seconds: 3), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNav()));
   });
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 16, 56),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(
            top:MediaQuery.of(context).size.height/3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           
            children: [
              
              Image.asset('assets/music.gif',
              height: 170,
              width: 170,),
              const Text('A U R A L U X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold 
              ),),
            ],
          ),
        ),
      ),
    );
  }
}