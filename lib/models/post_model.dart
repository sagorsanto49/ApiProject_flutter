class PostModel {
  final int id;
  final int userid;
   final String title;
    final String body;

    PostModel({
      required this.id,
      required this.title,
      required this.body,
      required this.userid,
    });
    factory PostModel.fromJson(Map<String, dynamic>json ){
      return PostModel(
        id: json['id'],
         title:json['title'],
        body: json['body'],
         userid: json['userId']);

    }


}