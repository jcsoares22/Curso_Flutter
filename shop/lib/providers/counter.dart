import 'package:flutter/material.dart';

class CounterState {
  int _valor = 0;

  void inc() => _valor++;
  void dec() => _valor--;
  int get value => _valor;
}

 class CounterProvider extends InheritedWidget {
  final CounterState state = CounterState();
  CounterProvider({super.key, required Widget child}) : super(child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  bool updateSgouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

}
