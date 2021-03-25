import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/src/pages/Facturas_page.dart';
import 'package:flutter_login_ui/src/pages/inicio_page.dart';
import 'package:flutter_login_ui/src/pages/productos_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      
      // home: LoginScreen(),

      initialRoute: '/',

      routes: <String, WidgetBuilder>{
        '/' :(BuildContext context) =>LoginScreen(),
        'inicio' : (BuildContext context) => InicioPage(),
        'productos': (BuildContext context) => ProductosPage(),
        'facturas': (BuildContext context) => FacturaPage(),
      }
    );
  }


  
}
