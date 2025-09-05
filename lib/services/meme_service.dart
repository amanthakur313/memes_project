
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/meme_model.dart';

class MemeService{
  static Future<List<Meme>?> fetchMemes(
      BuildContext context
      ) async{
    final uri = Uri.parse('https://meme-api.com/gimme/wholesomememes/50');

    try{

      final response = await http.get(uri);
      if(response.statusCode==200){
        final data = json.decode(response.body);
        final memes = (data['memes'] as List).map((meme) =>Meme.fromJson(meme)).toList();
        return memes;
      }else{
        throw Exception('Failed to load memes');
      }

    }catch(e){
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Error to load memes ')),
);
    }
  }
}

