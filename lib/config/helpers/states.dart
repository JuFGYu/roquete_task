

import 'dart:math';

class RectangleStates {
  Future<bool> waitingTime () async {
    bool isLoaded;
    final random = Random();
    await Future.delayed(const Duration(seconds: 1));
    isLoaded = random.nextBool();
    return isLoaded;
  }
}