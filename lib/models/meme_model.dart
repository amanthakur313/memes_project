class Meme {
  final String postLink;
  final String subreddit;
  final String title;
  final String url;
  final bool nsfw;
  final String author;
  final int ups;
final List<String> preview;

const Meme({
    required this.postLink,
  required this.subreddit,
  required this.title,
  required this.url,
  required this.nsfw,
  required this.author,
  required this.ups,
  required this.preview
});


factory Meme.fromJson(Map<String,dynamic> json){
  return Meme(
      postLink: json['postLink'],
      subreddit: json['subreddit'],
      title:json['title'] ,
      url: json['url'],
      nsfw:json['nsfw'] ,
      author:json['author'] ,
      ups:json['ups'] ,
      preview:List<String>.from(json['preview']));

}

Map<String,dynamic> toJson(){
  return {
    'postLink':postLink,
    'subreddit':subreddit ,
    'title':title,
    'url': url,
    'nsfw': nsfw,
    'author':author,
    'ups':ups,
    'preview':preview
  };

}
}