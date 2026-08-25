import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/post_model.dart';
import 'package:flutter_application_12/post_details/post_details.dart';
import 'package:flutter_application_12/services/api_services.dart';
import 'package:flutter_application_12/utils/post_creat.dart';

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
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'My Posts',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
        ],
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
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              itemCount: posts.length,
              itemBuilder: (_, index) {
                final data = posts[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(20),

                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetails(
                        postId: data.id.toString(),
                      ),
                    ),
                  ),

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [

                              Container(
                                height: 48,
                                width: 48,

                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(14),
                                ),

                                child: Center(
                                  child: Text(
                                    data.id.toString(),
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  data.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          Text(
                            data.body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Divider(
                            height: 1,
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [

                              Icon(
                                Icons.person_outline_rounded,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                'User ID: ${data.userid}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const Spacer(),

                              Text(
                                'Read more',
                                style: TextStyle(
                                  color: Colors.blue.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade600,
        elevation: 5,

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PostCreat(),
            ),
          );
        },

        icon: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),

        label: const Text(
          'Create Post',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}