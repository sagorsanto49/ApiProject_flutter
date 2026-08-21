import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/post_model.dart';
import 'package:flutter_application_12/post_details/post_details.dart';
import 'package:flutter_application_12/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PostModel> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder(
        future: ApiServices.fetchData(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          if (snapshot.hasData) {
            posts = snapshot.data!;

            return ListView.builder(
              itemCount: posts.length,

              itemBuilder: (_, index) {

                final data = posts[index];

                return InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> PostDetails(
                    postId: data.id.toString(),



                  ))),
                  child: Card(
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
                  ),
                );

              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}