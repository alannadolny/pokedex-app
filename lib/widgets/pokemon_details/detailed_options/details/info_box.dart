import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String descriptionText;
  final String dataText;

  const InfoBox({
    required this.descriptionText,
    required this.dataText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descriptionText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          dataText,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
