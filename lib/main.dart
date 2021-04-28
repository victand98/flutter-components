import 'package:flutter/material.dart';

import 'package:components/src/routes/routes.dart';

import 'package:components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        print("Called Route: ${settings.name}");

        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
