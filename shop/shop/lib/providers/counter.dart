// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

//Classe para armazenar o estado que irei manipular o Provider
class CounterState {
  int _value = 0;

  void inc() => _value++;
  void dec() => _value--;
  int get value => _value;

  //Método quando for diferente - estado anterior
  bool diff(CounterState old) {
    return old._value != _value;
  }
}

class CounterProvider extends InheritedWidget {
  //Referenciando minha classe de cima dentro do provider
  final CounterState state = CounterState();

  CounterProvider({required Widget child}) : super(child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  //Notificando uma mudança
  //Sempre que o estado (int _value = 0) for diferente, vai notificar que houve uma mudança
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}
