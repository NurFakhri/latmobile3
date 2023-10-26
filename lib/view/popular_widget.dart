import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 203, 170),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                  )
                ]),
            child: Column(children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/pizza.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pizza',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rp.20.000",
                  style: TextStyle(
                      fontSize: 10, color: Colors.black.withOpacity(0.7)),
                ),
              )
            ]),
          )
      ],
    );
  }
}
