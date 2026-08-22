import 'package:flutter_application_12/utils/config.dart';

class ApiEndpoints {

  static const String apiUrl = AppConfig.baseUrl;

  static Uri allposts = Uri.parse('$apiUrl/posts');

  static String singlePost = '$apiUrl/posts';

}