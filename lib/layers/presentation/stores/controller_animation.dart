import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class ControllerAnimation extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  void _changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      _changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      _changeHomeState(HomeState.normal);
    }
  }
}
