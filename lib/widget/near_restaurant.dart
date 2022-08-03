import 'package:food_delivery_app_a/data/data.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_a/screens/restaurant_screen.dart';

class NearRestaurant extends StatefulWidget {
  const NearRestaurant({Key? key}) : super(key: key);

  @override
  State<NearRestaurant> createState() => _NearRestaurantState();
}

class _NearRestaurantState extends State<NearRestaurant> {
  builderNearRestaurant() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RestaurantScreen(
                      restaurant: restaurant,
                    )));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(0.8),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        width: 150,
                        "${restaurant.imageUrl}",
                        fit: BoxFit.cover,
                        height: double.maxFinite,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${restaurant.name}",
                            ),
                            Text(
                              "${restaurant.address}",
                            ),
                            const Text(
                              "0.1 miles",
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return builderNearRestaurant();
  }
}
