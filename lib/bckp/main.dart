import 'package:flutter/material.dart';
import '../login/setting.dart';
import '../login/login.dart';
import '../pages/home_page.dart';
import '../login/auth.dart';

void main() =>  runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

String _title = "Please Login";
Widget _screen;
login _login;
HomePage _settings;
bool _authenticated;

_MyAppState() {
  _login = new login(onSubmit: (){onSubmit();});
  _settings = new HomePage();
  _screen = _login;
  _authenticated = false;
}

void onSubmit() {
  // sini nak kena masuk ke db untuk username ngan password


  print('Login With: ' +_login.username + ' ' + _login.password);
  if(_login.username =="a" && _login.password == '1') {
    _setAuthenticated(true);
  } else {
    _screen = _login;
  }
}

void _goHome() {
  print('go home $_authenticated');

  setState(() {
    if (_authenticated == true) {
      _screen = _settings;
    }
    else {
      _screen = _login;
    }
  });
}

void _logout() {
  print('logout');
 _setAuthenticated(false);
}

void _setAuthenticated(bool auth) {
  setState(() {
    if (auth == true) {
      _screen = _settings;
      _title = 'Welcome';
      _authenticated =true;
    }
    else {
      _screen = _login;
      _title = "Please Login";
      _authenticated = false;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     title: 'Login Demo',
     debugShowCheckedModeBanner: false,
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text(_title),
         actions: <Widget>[
           new IconButton(icon: new Icon(Icons.home), onPressed: (){_goHome();}),
           new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){_logout();})
         ],
       ),
       body: _screen,
     )
    );
  }
}
