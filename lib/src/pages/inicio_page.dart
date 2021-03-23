
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                checkLoginStatus();
              },
              child: Text("Log out"))
        ],
      ),
      body: Column(
        children: [
          ListView(children: [
            Text('tr')
          ],)
        ],
      ),
    );
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('id') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }
}
