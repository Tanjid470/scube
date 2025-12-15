import 'package:flutter/material.dart';
import 'package:scube/core/const/color_utils.dart';

class DataItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const DataItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F4FE),
        border: Border.all(color: ColorUtils.greyCustom),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item['image'],
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: item['color'],
                        border: Border.all(color: ColorUtils.greyCustom),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:  Colors.black87 ,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item['active'] ? '(Active)' : '(Inactive)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:
                        item['active'] ? Colors.blue : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Data 1  : ${item['data1']}'),
                Text('Data 2  : ${item['data2']}'),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
