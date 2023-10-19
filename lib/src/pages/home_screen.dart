import 'package:flutter/material.dart';

import '../apiCall/api_client.dart';
import '../constants/app_constants.dart';
import '../models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<toDoModel> detailsInfo = [];

  @override
  void initState() {
    super.initState();
    fetchToDoList(); // Call the function to fetch ToDo items when the widget initializes
  }

  Future<void> fetchToDoList() async {
    final apiClient = ApiClient(baseUrl: AppConstants.TODO_URI);
    final todos = await apiClient.getAllToDos();

    setState(() {
      detailsInfo = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: detailsInfo.isEmpty
          ? Center(
        child: CircularProgressIndicator(), // Show a loading indicator while data is being fetched
      )
          : ListView.builder(
        itemCount: detailsInfo.length,
        itemBuilder: (context, index) {
          final todo = detailsInfo[index];
          return ListTile(
            title: Text(todo.todo),
            subtitle: Text('Completed: ${todo.completed}'),
          );
        },
      ),
    );
  }
}
