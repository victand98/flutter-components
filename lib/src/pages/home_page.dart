import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

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
        children: _listItems(snapshot.data),
      ),
    );
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element["texto"]),
        leading: Icon(Icons.access_alarm, color: Colors.redAccent),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
        onTap: () {},
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
