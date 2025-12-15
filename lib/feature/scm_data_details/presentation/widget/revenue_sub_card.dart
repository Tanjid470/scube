import 'package:flutter/material.dart';
import 'package:scube/core/const/color_utils.dart';

class RevenueSubCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;

  const RevenueSubCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Data   $index ',style: TextStyle(fontWeight: FontWeight.w400,color: ColorUtils.black54)),
              Text(': ${item['value']} (${item['percentage']}%)',style: TextStyle(fontWeight: FontWeight.w600))
            ],
          ),
          Row(
            children: [
              Text('Cost   $index ',style: TextStyle(fontWeight: FontWeight.w400,color: ColorUtils.black54)),
              Text(': ${item['cost']} ৳',style: TextStyle(fontWeight: FontWeight.w600))
            ],
          ),
        ],
      ),
    );
  }
}
