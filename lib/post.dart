class Post {
  final int id;
  final String title;
  final int body;

  Post({required this.id,required this.title, required this.body});

  Post.fromJson(Map<String,dynamic> json)
  : id= json['id'],
  title=json['title'],
  body=json['body'];


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'body':body,
    };
  }
}