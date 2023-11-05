import 'package:delivery/model/food_api_model.dart';
import 'package:delivery/model/food_model.dart';
import 'package:delivery/view/widget/food_card.dart';
import 'package:flutter/material.dart';

class AllFood extends StatefulWidget {
  const AllFood({super.key});

  @override
  State<AllFood> createState() => _AllFoodState();
}

class _AllFoodState extends State<AllFood> {
  late List<Food> _food;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getFood();
  }

  Future<void> getFood() async {
    _food = await FoodApi.getFood();
    setState(() {
      _isLoading = false;
    });
  }

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
                Text('Food Menu')
              ],
            )),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _food.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    title: _food[index].name,
                    cookTime: _food[index].totalTime,
                    rating: _food[index].rating.toString(),
                    thumbnailUrl: _food[index].images,
                  );
                },
              ));
  }
}
