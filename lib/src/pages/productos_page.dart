import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/Productos_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductosPage extends StatefulWidget {
  ProductosPage({Key key}) : super(key: key);

  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
   @override
  void initState() {
    tomarDatos();
    super.initState();
  }
  List<ProductosApi> registros = [];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
              },
              child: Text("Log out"))
        ],
      ),
      body: Column(
        children: [
          verDatos(),
        ],
      ),
    );

  }

  Future<List<ProductosApi>> tomarDatos() async {
    String _url = 'efectivo.com.do';
    final url = Uri.https(_url, '/Api/public/api/products/1');
    var response = await http.get(url);
    var jsonDta = json.decode(response.body);
    for (jsonDta in jsonDta) {
      registros.add(ProductosApi.fromJson(jsonDta));
    }
    return registros;
  }




Widget verDatos() {

    
    return Expanded(
      child: ListView.builder(
        itemCount: registros.length,
        itemBuilder: (BuildContext context, int index) {
          registros[index].alertQuantity == null ? registros[index].alertQuantity = 'sin precio':registros[index].alertQuantity;
          registros[index].image == null ? registros[index].image = 'no image':registros[index].image;
          registros[index].productDescription == null ? registros[index].productDescription = 'sin descripcion':registros[index].productDescription;
          return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage:
                            NetworkImage('https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/o-que-e-produto-no-mix-de-marketing.png')
                      ),
                      title: Text(registros[index].name),
                      subtitle: Text(registros[index].alertQuantity),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text('ver mas'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(registros[index].name),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          
                                          FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage('https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/o-que-e-produto-no-mix-de-marketing.png')),
                                          Text(registros[index].alertQuantity),
                                          Text(registros[index].productDescription)
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }











  
}
