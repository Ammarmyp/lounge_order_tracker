import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderTile extends StatelessWidget {
  final double orderNum;
  final double tableNum;
  final Function(String orderNumber) onDelete;

  const OrderTile({
    super.key,
    required this.orderNum,
    required this.tableNum,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String formattedOrderNum = orderNum % 1 == 0
        ? orderNum.toInt().toString()
        : orderNum.toStringAsFixed(2);
    String formattedTableNum = tableNum % 1 == 0
        ? tableNum.toInt().toString()
        : tableNum.toStringAsFixed(2);

    return Slidable(
      key: ValueKey(orderNum), // a unique key for each order.

      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              onDelete(formattedOrderNum);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.green.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            tileColor: Colors.transparent,
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade200,
              child: const Icon(Icons.hourglass_empty, color: Colors.white),
            ),
            title: Text(
              "Order Number: $formattedOrderNum",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Table: $formattedTableNum",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
