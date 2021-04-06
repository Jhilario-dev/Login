import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/src/providers/facturas_provider.dart';
import 'package:flutter_login_ui/src/providers/productos_provider.dart';
import 'package:flutter_login_ui/src/widget/facturas_widget.dart';
import 'package:flutter_login_ui/src/widget/productos_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  var productosProvider = new ProductosProvider();
  var facturasProvider = new FacturasProvider();
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            
            elevation: 10,
            backgroundColor: Colors.green[400],
            title: Text('Inicio'),
            actions: <Widget>[
              _flat(),
              ],
          ),
        bottomNavigationBar: menu(),
          body: Container(
            child: TabBarView(
              children: [
                _productos(),
                _facturas(),
                _productos(),
                _productos(),
              ],),
          ),
        ),
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
    return IconButton(
      icon: Icon(Icons.logout),
      tooltip: 'Open shopping cart',
      onPressed: () {
        sharedPreferences.clear();
        sharedPreferences.commit();
        _checkLoginStatus(); // handle the press
    });
    
    
  }


  Widget _opciones(var opt){
    return Material(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, opt);
        },
        child: IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
               Navigator.pushNamed(context, opt);
            },
          )
    ));
  }


Widget _productos(){
  return FutureBuilder(
    future: productosProvider.tomarDatos(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      if (snapshot.hasData) {
        return ProductosWidget(registros: snapshot.data);
      }else {
          return Center(child: CircularProgressIndicator());
        }
  });
}
Widget _facturas(){
  return FutureBuilder(
    future: facturasProvider.tomarDatos(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      if (snapshot.hasData) {
        return FacturasWidget(registros: snapshot.data);
      }else {
          return Center(child: CircularProgressIndicator());
        }
  });
}
Widget menu() {
return Container(
  height: 60,
  color: Colors.green[400],
  child: TabBar(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        icon: Icon(Icons.shopping_bag),
      ),
      Tab(
        icon: Icon(Icons.fact_check_rounded),
      ),
      Tab(
        icon: Icon(Icons.people),
      ),
      Tab(
        icon: Icon(Icons.queue_rounded),
      ),
    ],
  ),
);
}
}
