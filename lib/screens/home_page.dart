import 'package:flutter/material.dart';
import 'package:food_delivery_app_a/data/data.dart';
import 'package:food_delivery_app_a/widget/near_restaurant.dart';
import 'package:food_delivery_app_a/widget/recent_order.dart';
import 'package:food_delivery_app_a/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: const Icon(
          Icons.account_circle,
          size: 30,
        ),
        title: const Text(
          "Food Delivery",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Cart (${currentUser.cart!.length})",
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SearchBar(),
          ),
          const RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Restaurant Near Me",
                style: TextStyle(fontSize: 20),
              ),
              NearRestaurant(),
            ],
          ),
        ],
      ),
    );
  }
}
