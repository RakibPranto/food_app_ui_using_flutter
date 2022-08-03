import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app_a/data/data.dart';
import 'package:food_delivery_app_a/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);
  _BuilderRecentOrder(BuildContext context, Order order) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
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
                  "${order.food!.imageUrl}",
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
                        "${order.food!.name}",
                      ),
                      Text(
                        "${order.restaurant!.name}",
                      ),
                      Text(
                        "${order.date}",
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 30,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Order",
          style: TextStyle(fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Order order = currentUser.orders![index];
                  return _BuilderRecentOrder(context, order);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
                itemCount: currentUser.orders!.length),
          ),
        )
      ],
    );
  }
}
