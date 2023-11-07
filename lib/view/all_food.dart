import 'package:delivery/view/widget/food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/model/food_model.dart';
import 'package:delivery/controller/food_controller.dart';

class AllFood extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 203, 170),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Menu'),
          ],
        ),
      ),
      body: Obx(() {
        if (foodController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: foodController.foodList.length,
            itemBuilder: (context, index) {
              Food food = foodController.foodList[index];
              return FoodCard(
                title: food.name,
                cookTime: food.totalTime,
                rating: food.rating.toString(),
                thumbnailUrl: food.images,
              );
            },
          );
        }
      }),
    );
  }
}
