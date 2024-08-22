import 'package:flutter/material.dart';
import 'package:pokedex_app/consts.dart';

class OptionsList extends StatelessWidget {
  final int activeOption;

  const OptionsList({
    this.activeOption = 0,
    super.key,
  });

  Color getOptionColor(int optionIdx) {
    return optionIdx == activeOption
        ? DEFAULT_COLOR
        : DEFAULT_GRAY;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.05)],
            stops: const [0.6, 1],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: POKEMON_DETAILS_OPTIONS.length,
          itemBuilder: (ctx, idx) => Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Text(
              POKEMON_DETAILS_OPTIONS[idx],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: getOptionColor(idx),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
