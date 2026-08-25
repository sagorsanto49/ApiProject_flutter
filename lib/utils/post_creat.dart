import 'package:flutter/material.dart';
import 'package:flutter_application_12/services/api_services.dart';

class PostCreat extends StatelessWidget {
  const PostCreat({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text('Creat Post'),
      ),
body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [
      TextField(
        controller: titleController,
        decoration: const InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 20),

      TextField(
        controller: descriptionController,
        maxLines: 5,
        decoration: const InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder(),
        ),
      ),

      const SizedBox(height: 20),

      
    ],
  ),
),



      floatingActionButton: FloatingActionButton(onPressed: () => ApiServices.createPost(titleController.text, descriptionController.text),
      child: Icon(Icons.done),
      ) 


    );
  }
} 