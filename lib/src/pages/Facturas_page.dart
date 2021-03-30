import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/Facturas_api.dart';
import 'package:flutter_login_ui/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FacturaPage extends StatefulWidget {

  @override
  _FacturaPageState createState() => _FacturaPageState();
}
  List<FacturasApi> _registros = [];

class _FacturaPageState extends State<FacturaPage> {
SharedPreferences empresa;
  @override
  void initState() {
    

    super.initState();
    tomarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facturas'),
      ),
      body: Column(
        children: [
          verDatos(),
        ],
      ),
    );
  }

  Future<List<FacturasApi>> tomarDatos() async {
    String _url = 'efectivo.com.do';
    empresa = await SharedPreferences.getInstance();
    var empre = empresa.getString('businessId');
    final url = Uri.https(_url, '/Api/public/api/transactions/'+ empre);
    var response = await http.get(url);
    var jsonDta = json.decode(response.body);
    for (jsonDta in jsonDta) {
      _registros.add(FacturasApi.fromJson(jsonDta));
    }
    return _registros;
  }

  Widget verDatos() {
    return Expanded(
      child: ListView.builder(
        itemCount: _registros.length,
        itemBuilder: (BuildContext context, int index) {
          _registros[index].id == null? _registros[index].id = 'sin id': _registros[index].id;
          _registros[index].transactionDate == null? _registros[index].transactionDate = 'sin fecha': _registros[index].transactionDate;
          _registros[index].invoiceNo == null? _registros[index].invoiceNo = 'numero desconocido': _registros[index].invoiceNo;
          _registros[index].taxAmount == null? _registros[index].taxAmount = 'desconocido': _registros[index].taxAmount;
          _registros[index].discountAmount == null? _registros[index].discountAmount = 'desconocido': _registros[index].discountAmount;
          _registros[index].finalTotal == null? _registros[index].finalTotal = 'sin total': _registros[index].finalTotal;
          return Container(
              child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: ListBody(
                    children: [
                      // FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage('https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/o-que-e-produto-no-mix-de-marketing.png')),
                      Text('Factura Id: ' + _registros[index].id),
                      Text('Fecha : ' + _registros[index].transactionDate),
                      Text('Estado: ' + _registros[index].status),
                      Text('Costo total: ' + _registros[index].finalTotal)
                    ],
                  ),
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
                                title: Text('Factura No: '+_registros[index].invoiceNo, style: texStyle),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text('Factura Id: ' +_registros[index].id, style: texStyle,),
                                      Text('Fecha : ' +_registros[index].transactionDate, style: texStyle),
                                      Text('Estado: ' +_registros[index].status, style: texStyle),
                                      Row(
                                        children: [
                                          Text('Monto de Tax: '), 
                                          Text(_registros[index].taxAmount,textAlign: TextAlign.center),
                                        ],
                                      ),
                                      Text('Descuento: ' +_registros[index].discountAmount, style: texStyle),
                                      Text('Costo total: ' + _registros[index].finalTotal, style: texStyle),
                                      
                                    ],
                                  ),
                                ),
                              );
                            });
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
