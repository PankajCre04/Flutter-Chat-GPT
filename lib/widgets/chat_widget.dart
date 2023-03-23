import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/services/asset_manager.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chatIndex, required this.msg});
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetManager.userImage
                      : AssetManager.botImage,
                  height: 27,
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(label: msg)
                      : DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                msg.trim(),
                              ),
                            ],
                          ),
                        ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
