
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/Facturas_api.dart';
import 'package:flutter_login_ui/utilities/constants.dart';



class FacturasWidget extends StatelessWidget {

  final List<FacturasApi> registros;

  FacturasWidget({@required this.registros});
 


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: registros.length,
        itemBuilder: (BuildContext context, int index) {
          registros[index].id == null? registros[index].id = 'sin id': registros[index].id;
          registros[index].transactionDate == null? registros[index].transactionDate = 'sin fecha': registros[index].transactionDate;
          registros[index].invoiceNo == null? registros[index].invoiceNo = 'numero desconocido': registros[index].invoiceNo;
          registros[index].taxAmount == null? registros[index].taxAmount = 'desconocido': registros[index].taxAmount;
          registros[index].discountAmount == null? registros[index].discountAmount = 'desconocido': registros[index].discountAmount;
          registros[index].finalTotal == null? registros[index].finalTotal = 'sin total': registros[index].finalTotal;
          return Container(
              child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: ListBody(
                    children: [
                      // FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage('https://rockcontent.com/es/wp-content/uploads/sites/3/2019/02/o-que-e-produto-no-mix-de-marketing.png')),
                      Text('Factura Id: ' + registros[index].id),
                      Text('Fecha : ' + registros[index].transactionDate),
                      Text('Estado: ' + registros[index].status),
                      Text('Costo total: ' + registros[index].finalTotal)
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
                                title: Text('Factura No: '+registros[index].invoiceNo, style: texStyle),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text('Factura Id: ' +registros[index].id, style: texStyle,),
                                      Text('Fecha : ' +registros[index].transactionDate, style: texStyle),
                                      Text('Estado: ' +registros[index].status, style: texStyle),
                                      Row(
                                        children: [
                                          Text('Monto de Tax: '), 
                                          Text(registros[index].taxAmount,textAlign: TextAlign.center),
                                        ],
                                      ),
                                      Text('Descuento: ' +registros[index].discountAmount, style: texStyle),
                                      Text('Costo total: ' + registros[index].finalTotal, style: texStyle),
                                      
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
