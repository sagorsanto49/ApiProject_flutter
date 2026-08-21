import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String postId;
  const PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postId),
      ),




    );
  }
}