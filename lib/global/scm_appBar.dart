import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationTap;

  const CustomAppBar({
    super.key,
    this.title = "SCM",
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: TextSize.font18(context),
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: onNotificationTap,
              icon: const Icon(Icons.notifications_none, color: Colors.black54),
            ),

            // Red dot
            Positioned(
              bottom: 25,
              right: 15,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
