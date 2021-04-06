// import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_ui/utilities/constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_login_ui/utilities/Productos_api.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProductosPage extends StatefulWidget {
//   @override
//   _ProductosPageState createState() => _ProductosPageState();
// }

//   List<ProductosApi> registros = [];
// class _ProductosPageState extends State<ProductosPage> {
//    @override
//   void initState() {
//     _tomarDatos();
//     super.initState();
//   }
// SharedPreferences empresa;

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         title: Text('Productos'),
        
//       ),
//       body: Column(
//         children: [
//           verDatos(),
//         ],
//       ),
//     );

//   }

//   Future<List<ProductosApi>> _tomarDatos() async {
//     String _url = 'efectivo.com.do';

//     empresa = await SharedPreferences.getInstance();
//     var empre = empresa.getString('businessId');
//     final url = Uri.https(_url, '/Api/public/api/products/'+ empre );
//     var response = await http.get(url);
//     var jsonDta = json.decode(response.body);
//     for (jsonDta in jsonDta) {
      
//         registros.add(ProductosApi.fromJson(jsonDta));
      
//     }
//     return registros;
//   }
//   Widget verDatos() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: registros.length,
//         itemBuilder: (BuildContext context, int index) {
//           registros[index].alertQuantity == null ? registros[index].alertQuantity = 'sin precio':registros[index].alertQuantity;
//           registros[index].productDescription == null ? registros[index].productDescription = 'sin descripcion':registros[index].productDescription;
//           return GestureDetector(
//             onTap: (){
//               showDialog(
//               context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text(registros[index].name),
//                     content: SingleChildScrollView(
//                       child: ListBody(
//                         children: [
//                           FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage(registros[index].image)),
//                           Text(registros[index].alertQuantity),
//                           Text(registros[index].productDescription)
//                         ],
//                       ),
//                     ),
//                   );
//               }
//               );
//             },
//             child: Container(
              
//               padding: EdgeInsets.all(5),
//               margin: EdgeInsets.all(10),
//               child: FittedBox(
//                 child: Material(
                  
//                   color: Colors.white,
//                   elevation: 14.0,
//                   borderRadius: BorderRadius.circular(3.0),
//                   shadowColor: Colors.black,
//                   child:Row(
//                     children: <Widget>[

//                       Container(
//                         margin: EdgeInsets.all(3),
//                         width: 30,
//                         height: 25,
//                         child: ClipRRect(
//                           child: Image(
//                             fit: BoxFit.fill,
//                             alignment: Alignment.centerRight,
//                             image: NetworkImage(registros[index].image),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 70,
//                         margin: EdgeInsets.all(3),
//                         child: Column(
//                           children: [
//                             Text(registros[index].name, style: TextStyle( fontSize: 5),),
                            
//                           ],
//                         ),
//                       ),
//                       Container(
//                          width: 20,
//                         child: Text("" +registros[index].alertQuantity,style: TextStyle( fontSize: 5)),

//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }