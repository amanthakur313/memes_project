
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_project/services/meme_service.dart';
import 'package:memes_project/widgets/meme_card.dart';

import '../models/meme_model.dart';

class MemePage extends StatefulWidget{
  State<MemePage> createState() => _MemePageState();
}
class _MemePageState extends State<MemePage>{
  List<Meme> memes = [];
bool isLoading = true;
Color backgroundColor = Colors.deepPurple;


void updateBackgroundColor(Color color){
  setState((){
backgroundColor = color;
  });

}

void initState(){
  super.initState();
  fetchMemes();
}

// Future<void> fetchMemes() async{
//   final fetchMemes = await MemeService.fetchMemes(context);
//   setState(() {
//     memes = fetchMemes!;
//     isLoading = false;
//   });
// }

  Future<void> fetchMemes() async {
    final fetchedMemes = await MemeService.fetchMemes(context);
    setState(() {
      memes = fetchedMemes ?? []; // ✅ safe
      isLoading = false;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
appBar: AppBar(
  title: Text("Meme App"),
  centerTitle: true,
  backgroundColor: backgroundColor.withOpacity(0.8),
),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
backgroundColor.withOpacity(0.8),
            
backgroundColor.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
            end: Alignment.topRight,

          )

        ),
        child: isLoading
        ? Center(child: CircularProgressIndicator(),):
        memes.isEmpty ? Center(child: Text("No meme available"),):
            ListView.builder(
                itemCount: memes.length,
                itemBuilder: (context,index){
                  final meme = memes[index];
return MemeCard(title: meme.title, ups:meme.ups, postLink: meme.postLink, imageUrl: meme.url, onColorExtracted: updateBackgroundColor);
                }

            )
        ,
      ),
    );
  }

}