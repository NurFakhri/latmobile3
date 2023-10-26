import 'package:delivery/model/todos.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var todo = Todos(userId: 0, id: 0, title: '', completed: false).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodoData();
  }

  fetchTodoData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
      if (response.statusCode == 200) {
        todo.value = todosFromJson(response.body);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
