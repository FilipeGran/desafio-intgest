const baseUrl = 'https://parseapi.back4app.com';

abstract class Endpoints {
  static const String signin = '$baseUrl/users';
  static const String currentUser = '$baseUrl/users/me';
  static const String logout = '$baseUrl/logout';
  static const String login = '$baseUrl/login';
  static const String getUser = '$baseUrl/users';
  static const String newTask = '$baseUrl/classes/task';
  static const String updateTask = '$baseUrl/classes/task';
  static const String deleteTask = '$baseUrl/classes/task';
}
