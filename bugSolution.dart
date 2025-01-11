```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //More specific error handling
      throw HttpException('HTTP error: ${response.statusCode}', response.body);
    }
  } on SocketException catch (e) {
    // Handle socket exceptions specifically
    throw Exception('No internet connection: $e');
  } on FormatException catch (e) {
    //Handle JSON format exceptions
    throw Exception('Invalid JSON format: $e');
  } on HttpException catch (e) {
    //Handle HTTP exceptions
    print('HTTP Error: ${e.message}'); //log this
    rethrow; //Re-throw with context for debugging
  } catch (e) {
    //Catch all other exceptions
    print('An unexpected error occurred: $e'); //log this
    rethrow; // Re-throw to be handled higher up
  }
}

class HttpException implements Exception {
  final String message;
  final String? responseBody;

  HttpException(this.message, this.responseBody);

  @override
  String toString() => 'HttpException: $message';
}
```