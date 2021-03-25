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
    super.initState();
    _checkLoginStatus();
  }

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: <Widget>[
          _flat()
          ],
      ),
      
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            _opciones('productos'),
            _opciones('facturas'),
            
            _opciones('clientes'),
            _opciones('compra'),
            _opciones('cotizacion'),
        ]),
      ),
    );
  }

  _checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('id') == null) {
      Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      (Route<dynamic> route) => false);
    }
  }

  Widget _flat() {
    return FlatButton(
     onPressed: () {
       sharedPreferences.clear();
       sharedPreferences.commit();
       _checkLoginStatus();
     },
     child: Text("Log out"));
  }


  Widget _opciones(var opt){
    return FlatButton(
      
      color: Colors.blue[200],
            onPressed: () {
              Navigator.pushNamed(context, opt);
            },
            child: Text(opt));
  }


}
