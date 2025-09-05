

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_project/screens/meme_home_page.dart';

void main(){
  runApp(MemeApp());
 }

 class MemeApp extends StatelessWidget{
  const MemeApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MemePage() ,
    );
  }
 }