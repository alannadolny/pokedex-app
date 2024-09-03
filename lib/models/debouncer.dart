import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  Timer? timer;

  Debouncer({
    required this.milliseconds,
  });

  void run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }

  void dispose() {
    timer?.cancel();
  }
}
