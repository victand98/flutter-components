import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Card Title"),
            subtitle: Text("Description card "),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text("Cancel")),
              TextButton(onPressed: () {}, child: Text("Ok")),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                'https://artofcreativephotography.com/wp-content/uploads/2019/03/David-Koester-Start-In-Die-Landschaftsfotografie-I.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(padding: EdgeInsets.all(10.0), child: Text("Image Text"))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, -10.0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
