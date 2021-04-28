import "package:flutter/services.dart" show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  // _MenuProvider() {}

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu-opts.json');
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = _MenuProvider();
