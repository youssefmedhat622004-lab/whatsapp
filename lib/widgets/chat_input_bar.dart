import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => onSend(),
              style: const TextStyle(color: AppColors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: AppColors.white, fontSize: 12),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt, color: AppColors.textGray),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Camera tapped')),
                    );
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: AppColors.textGray, size: 20),
                  onPressed: onSend,
                ),
                filled: true,
                fillColor: AppColors.blackBg,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.inputBorderGreen, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.inputBorderGreen, width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.mic, color: AppColors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voice recording...')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
