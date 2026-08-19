import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/post_model.dart';
import 'package:flutter_application_12/services/api_services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PostModel> posts = [];


  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData () async {
    final data = await ApiServices.fetchData();

    setState(() {
      posts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: posts.length,

        itemBuilder: (_, index) {

          final data = posts[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  data.id.toString(),
                ),
              ),

              title: Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 8),

                  Text(
                    data.body,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'User ID: ${data.userid}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          );

        },
      ),
    );
  }
}