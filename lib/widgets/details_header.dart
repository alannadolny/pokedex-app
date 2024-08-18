import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
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
        const Column(
          children: [
            Text(
              'Venusaur',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              '003',
              style: TextStyle(
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
