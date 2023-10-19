class toDoModel {
  int id;
  String todo;
  bool completed;
  int userId; // Change the data type to int

  toDoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory toDoModel.fromJson(Map<String, dynamic> json) {
    return toDoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'], // Expect 'userId' as an integer
    );
  }
}
