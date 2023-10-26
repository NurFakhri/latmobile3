import 'package:delivery/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menggunakan GetMaterialApp
      title: 'Tampilan Data API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoDisplayScreen(),
    );
  }
}

class TodoDisplayScreen extends StatelessWidget {
  final controller = Get.put(TodoController()); // Menginisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tampilan Data API')),
      body: Obx(() {
        // Menggunakan Obx untuk mendengarkan perubahan state
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("UserID: ${controller.todo.value.userId}"),
                SizedBox(height: 10),
                Text("ID: ${controller.todo.value.id}"),
                SizedBox(height: 10),
                Text("Title: ${controller.todo.value.title}"),
                SizedBox(height: 10),
                Text("Completed: ${controller.todo.value.completed}"),
              ],
            ),
          );
        }
      }),
    );
  }
}
