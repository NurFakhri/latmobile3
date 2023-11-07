import 'package:get/get.dart';
import 'package:delivery/model/food_model.dart';
import 'package:delivery/model/food_api_model.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFood();
  }

  Future<void> getFood() async {
    try {
      isLoading.value = true;
      var foods = await FoodApi.getFood();
      foodList.assignAll(foods);
    } finally {
      isLoading.value = false;
    }
  }
}
