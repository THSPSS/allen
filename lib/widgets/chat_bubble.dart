import 'package:flutter/material.dart';

import '../pallete.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: EdgeInsets.symmetric(horizontal: 40).copyWith(
        top: 30,
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20.0).copyWith(topLeft: Radius.zero),
        border: Border.all(
          color: Pallete.borderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Text(
          'Hello! What task can I do for you?',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Cera Pro',
            color: Pallete.mainFontColor,
          ),
        ),
      ),
    );
  }
}
