import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/components/order_tile.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, double>> orders = [
      {"orderNum": 1, "tableNum": 53},
      {"orderNum": 2, "tableNum": 54},
      {"orderNum": 3, "tableNum": 55},
    ];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: orders
                .map((order) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OrderTile(
                        orderNum: order["orderNum"]!,
                        tableNum: order["tableNum"]!,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
