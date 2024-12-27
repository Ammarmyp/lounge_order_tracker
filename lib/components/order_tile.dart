import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final double orderNum;
  final double tableNum;

  const OrderTile({super.key, required this.orderNum, required this.tableNum});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(orderNum.toString()),
      title: Text(tableNum.toString()),

      // style: ,
      tileColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}
