import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blackBg,
      elevation: 0,
      leadingWidth: 85,
      leading: Row(
        children: [
          const SizedBox(width: 4),
          const Icon(Icons.arrow_back, color: AppColors.white, size: 20),
          const SizedBox(width: 4),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/profile_pic.png'),
          ),
        ],
      ),
      title: const Text(
        'youssef',
        style: TextStyle(
          color: AppColors.green,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam, color: AppColors.white, size: 22),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Video call started')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.call, color: AppColors.white, size: 20),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Voice call started')),
            );
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: AppColors.white, size: 20),
          color: AppColors.outgoingBubble,
          onSelected: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Selected: $value')),
            );
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'View contact',
              child: Text('View contact', style: TextStyle(color: AppColors.white)),
            ),
            const PopupMenuItem<String>(
              value: 'Media, links, and docs',
              child: Text('Media, links, and docs', style: TextStyle(color: AppColors.white)),
            ),
            const PopupMenuItem<String>(
              value: 'Search',
              child: Text('Search', style: TextStyle(color: AppColors.white)),
            ),
            const PopupMenuItem<String>(
              value: 'Mute notifications',
              child: Text('Mute notifications', style: TextStyle(color: AppColors.white)),
            ),
            const PopupMenuItem<String>(
              value: 'Wallpaper',
              child: Text('Wallpaper', style: TextStyle(color: AppColors.white)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
