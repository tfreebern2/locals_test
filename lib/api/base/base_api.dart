import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class BaseApi {
  final _client = http.Client();

  Future<dynamic> post(
      String url, Map<String, String> headers, dynamic body) async {
    final response =
        await _client.post(Uri.parse(url), headers: headers, body: body);
    return parseResponse(response);
  }

  dynamic parseResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body.toString());
        if (responseJson['result'] != null) {
          final result = responseJson['result'];
          return result;
        } else {
          final data = responseJson['data'];
          return data;
        }
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorisedException(response.body);
      case 403:
        break;
      case 404:
        throw NotFoundException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with StatusCode : ${response.statusCode}');
    }
  }
}
