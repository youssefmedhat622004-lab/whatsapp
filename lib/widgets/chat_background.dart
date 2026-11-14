import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ChatBackground extends StatelessWidget {
  final Widget child;

  const ChatBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackBg,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/whatsapp_bg.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
