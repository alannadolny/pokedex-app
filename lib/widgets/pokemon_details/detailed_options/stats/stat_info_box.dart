import 'package:flutter/material.dart';

class StatInfoBox extends StatelessWidget {
  final String titleText;
  final String leftText;
  final String rightText;

  const StatInfoBox({
    required this.titleText,
    required this.leftText,
    required this.rightText,
    super.key,
  });

  static const subtitleTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: subtitleTextStyle,
            ),
            Text(
              rightText,
              style: subtitleTextStyle,
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
