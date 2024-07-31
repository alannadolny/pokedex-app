import 'package:flutter/material.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData().copyWith(
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(
                color: DEFAULT_COLOR,
              ),
            ),
      ),
      routerConfig: router,
    );
  }
}
