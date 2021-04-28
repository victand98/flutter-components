import 'package:flutter/material.dart';

import 'package:components/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes',
        debugShowCheckedModeBanner: false,
        home: HomePageTemp());
  }
}
