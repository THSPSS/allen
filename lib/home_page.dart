import 'package:allen/widgets/feature_box.dart';
import 'package:flutter/material.dart';

import 'pallete.dart';
import 'widgets/chat_bubble.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chapp'),
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: [
            //virtual assistacne part
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.only(
                      top: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Pallete.assistanceCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 135,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/virtualAssistance.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ChatBubble(),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 22),
              child: Text(
                'Here are a few commands',
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //features list
            //conditionally showing column
            Column(
              children: [
                FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  headerText: 'ChatGPT',
                  descriptionText:
                      'A smarter way to stay organized and informed with ChatGPT',
                ),
                FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: 'Dall-E',
                  descriptionText:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
                FeatureBox(
                  color: Pallete.thirdSuggestionBoxColor,
                  headerText: 'Smart Voice Assistant',
                  descriptionText:
                      'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                ),
              ],
            )
          ],
        ));
  }
}
