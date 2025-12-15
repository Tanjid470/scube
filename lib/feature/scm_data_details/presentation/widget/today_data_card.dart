import 'package:flutter/material.dart';
import 'package:scube/core/const/color_utils.dart';

class TodayDataCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const TodayDataCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: ColorUtils.greyCustom),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: item['color'],
              ),
              Text('${item['name']}',style: TextStyle(fontWeight: FontWeight.w600))
            ],
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1),
            width: 1,
            height: 35,
            decoration: BoxDecoration(
              color: ColorUtils.greyCustom
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Data    ',style: TextStyle(fontWeight: FontWeight.w400,color: ColorUtils.black54)),
                    Text(': ${item['value']} (${item['percentage']}%)',style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
                Row(
                  children: [
                    Text('Cost    ',style: TextStyle(fontWeight: FontWeight.w400,color: ColorUtils.black54)),
                    Text(': ${item['cost']} ৳',style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
