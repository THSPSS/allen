import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;
  const FeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerText,
              style: TextStyle(
                fontFamily: 'Cera Pro',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              descriptionText,
              style: TextStyle(
                fontFamily: 'Cera Pro',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
