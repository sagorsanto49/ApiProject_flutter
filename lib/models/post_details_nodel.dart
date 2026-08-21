class PostDetailsModel {
     final int id;
  final int userid;
   final String title;
    final String body;

    PostDetailsModel({

      required this.id,
      required this.title,
      required this.body,
      required this.userid,

    });
    factory PostDetailsModel.fromJson(Map<String, dynamic>json ){
      return PostDetailsModel(
        id: json['id'],
         title:json['title'],
        body: json['body'],
         userid: json['userId']);

    }





}