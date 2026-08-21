import 'dart:convert';

import 'package:flutter_application_12/models/post_details_nodel.dart';
import 'package:flutter_application_12/models/post_model.dart';
import 'package:flutter_application_12/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static Future<List<PostModel>> fetchData() async { 

  
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(ApiEndpoints.allposts);
    if (response.statusCode == 200) {
      // print('Success');
      // print(response.body);

      final jsonData = jsonDecode(response.body);

      return (jsonData as List)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();

    } else {

      print('Failed');
      throw Exception('Failed to load posts');
    }
  }



static Future<PostDetailsModel?>  getSinglePost (String id) async{


final response = await http.get(Uri.parse('${ApiEndpoints.singlePost}/$id'));

if (response.statusCode == 200){
  final decode = jsonDecode(response.body);

}else{
  print('Error is ${response.body}');
}


}
}