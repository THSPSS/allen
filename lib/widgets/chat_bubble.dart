// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../pallete.dart';

class ChatBubble extends StatelessWidget {
  final String generatedContent;
  const ChatBubble({
    super.key,
    required this.generatedContent,
  });

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
          generatedContent.isEmpty
              ? 'Hello! What task can I do for you?'
              : generatedContent,
          style: TextStyle(
            fontSize: generatedContent == '' ? 20 : 15,
            fontFamily: 'Cera Pro',
            color: Pallete.mainFontColor,
          ),
        ),
      ),
    );
  }
}
