import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

import 'package:components/src/utils/icon_string_util.dart';

import 'package:components/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      // initialData: [], // optional
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
        children: _listItems(snapshot.data, context),
      ),
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element["texto"]),
        leading: getIcon(element["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
        onTap: () {
          //     final route = MaterialPageRoute(builder: (context) => AlertPage());
          //     Navigator.push(context, route);

          Navigator.pushNamed(context, element["ruta"]);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
