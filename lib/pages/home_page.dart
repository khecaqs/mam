import 'package:flutter/material.dart';
import './module.dart';

class HomePage extends StatefulWidget {
  @override
_HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  String mainProfilePicture = "https://vignette.wikia.nocookie.net/parody/images/1/10/IMG_7832.PNG/revision/latest?cb=20170706185218";
  String otherProfilePicture = "http://www.status77.in/wp-content/uploads/2015/07/K5Hw8zZi.jpeg";
  String decorationBoxImg = "http://www.cameronhighland.net/img/gunung-irau-brinchang.jpg";

  void switchUser(){
    String backupString = mainProfilePicture;
    this.setState((){
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("App Drawer"), backgroundColor: Colors.redAccent,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Mohammad Asha'ari Mustafa"),
              accountEmail: new Text("mam@gmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is current User"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                onTap: () => switchUser(),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(otherProfilePicture),
                )
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(decorationBoxImg),
                )
              ),
            ),
            new ListTile(
              title: new Text("Fist"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              },
            ),
            new ListTile(
              title: new Text("Second"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("Second Page")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Center(
        child: new Text("Home Page", style: new TextStyle(fontSize: 35.0),),
      ),
    );
  }
}