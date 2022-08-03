import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:locals_test/api/base/base_api.dart';
import 'package:locals_test/models/request/get_posts_request_body.dart';
import 'package:locals_test/models/response/post.dart';
import 'package:locals_test/models/response/user.dart';

class LocalsApi {
  final String baseUrl;
  final _baseApi = BaseApi();
  final connectivity = Connectivity();

  LocalsApi({this.baseUrl = 'https://app-test.rr-qa.seasteaddigital.com'});

  Future<bool> isOnline() async {
    final connectivityResult = await (connectivity.checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<User> login() async {
    final headers = <String, String>{
      "Connection": "keep-alive",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final body = <String, String>{};
    body['device_id'] = '7789e3ef-c87f-49c5-a2d3-5165927298f0';
    body['email'] = 'testlocals0@gmail.com';
    body['password'] = 'jahubhsgvd23';
    final response =
        await _baseApi.post('$baseUrl/app_api/auth.php', headers, body);
    return User.fromJson(response);
  }

  Future<List<Post>> getPosts(User user, GetPostsRequestBody body) async {
    final headers = <String, String>{
      "X-APP-AUTH-TOKEN": user.authToken,
      "X-DEVICE-ID": '7789e3ef-c87f-49c5-a2d3-5165927298f0'
    };
    final requestBody = jsonEncode(body.toJson());
    final response = await _baseApi.post(
            '$baseUrl/api/v1/posts/feed/global.json', headers, requestBody)
        as List;
    return response.map((post) => Post.fromJson(post)).toList();
  }
}
