import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = [];

    for (var item in options) {
      final tempWidget = ListTile(title: Text(item));
      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() => options
      .map((item) => Column(
            children: [
              ListTile(
                title: Text(item),
                subtitle: Text("Subtitle"),
                leading: Icon(Icons.sanitizer),
                trailing: Icon(Icons.arrow_upward_outlined),
                onTap: () {},
              ),
              Divider()
            ],
          ))
      .toList();
}
