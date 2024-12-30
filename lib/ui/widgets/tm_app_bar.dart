import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anayat Hossain',
                  style: textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  'ahhelpcentre@gmail.com',
                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout, color: Colors.white,))
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
