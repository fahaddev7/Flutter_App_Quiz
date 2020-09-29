import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/Home.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
@override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homepage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        Text("Quiz Arena",style: TextStyle(
          fontSize: 30.0,
          fontFamily: "Cursive",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("By FAHAD",style: TextStyle(
            fontSize: 12.0,
            
            color: Colors.white,
            
          ),
          ),
        ),
      
        ],
      ),
      )
      
    );
  }
}