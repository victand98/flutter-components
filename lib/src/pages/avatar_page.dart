import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("VR"),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage(
              "https://images.pexels.com/photos/6533790/pexels-photo-6533790.jpeg"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
