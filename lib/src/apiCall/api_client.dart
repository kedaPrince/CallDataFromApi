
import 'dart:convert';

import '../constants/app_constants.dart';
import '../models/todo_model.dart';
import 'package:http/http.dart' as http;
class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<List<toDoModel>> getAllToDos() async {
    final response = await http.get(Uri.parse('$baseUrl'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body)['todos'];
      final List<toDoModel> tripsList = responseData.map((data) =>
          toDoModel.fromJson(data)).toList();
      return tripsList;
    } else {
      throw Exception('Failed to load trip data');
    }
  }

}