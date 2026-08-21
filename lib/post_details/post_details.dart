import 'package:flutter/material.dart';
import 'package:flutter_application_12/services/api_services.dart';

class PostDetails extends StatelessWidget {
  final String postId;
  const PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postId),
      ),

body: FutureBuilder(future: ApiServices.getSinglePost(postId), builder: (_, snapshot){
  if (snapshot.connectionState == ConnectionState.waiting){
    return Center(
      child: CircularProgressIndicator(),
    );
  }else {
    return Column(
      children: [
        Text('Single Post'),
      ],
    );
  }
} ),);


  
  }
}