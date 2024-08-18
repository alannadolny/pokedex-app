import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsHeader extends StatelessWidget {
  final String name;
  final String id;

  const DetailsHeader({
    required this.name,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onBackArrowTap() {
      context.goNamed(
        'pokemonList',
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBackArrowTap,
          child: const Icon(Icons.arrow_back),
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Text(
              id,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
