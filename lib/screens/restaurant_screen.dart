import 'package:flutter/material.dart';
import 'package:food_delivery_app_a/models/food.dart';
import 'package:food_delivery_app_a/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen({Key? key, this.restaurant}) : super(key: key);
  Restaurant? restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenu(Food menuItem) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage(
                    '${menuItem.imageUrl}',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("${widget.restaurant!.imageUrl}"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.restaurant!.name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "${widget.restaurant!.address}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const Text(
                  "0.2 Miles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Review",
                    style: TextStyle(fontSize: 18),
                  )),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Contact",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children:
                    List.generate(widget.restaurant!.menu!.length, (index) {
                  Food food = widget.restaurant!.menu![index];
                  return _buildMenu(food);
                })),
          )
        ],
      ),
    );
  }
}
