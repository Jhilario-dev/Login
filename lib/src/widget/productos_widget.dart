
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/src/pages/productos_page.dart';
import 'package:flutter_login_ui/utilities/Productos_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';



class ProductosWidget extends StatefulWidget {
  final SharedPreferences empresa;
  final List<ProductosApi> registros;

  ProductosWidget({@required this.registros, this.empresa});

  @override
  _ProductosWidgetState createState() => _ProductosWidgetState();
}

class _ProductosWidgetState extends State<ProductosWidget> {

  //final List<ProductosApi> duplicateItems = registros;
  var items = List<String>();
  var filtro = TextEditingController();
  var f = NumberFormat('###.00', 'en_US');


//   void filterSearchResults(String query) {
//   List<ProductosApi> dummySearchList = [];
//   dummySearchList.addAll(duplicateItems);
//   if(query.isNotEmpty) {
//     List<String> dummyListData = List<String>();
//     dummySearchList.forEach((item) {
//       if(item.contains(query)) {
//         dummyListData.add(item);
//       }
//     });
//     setState(() {
//       items.clear();
//       items.addAll(dummyListData);
//     });
//     return;
//   } else {
//     setState(() {
//       items.clear();
//       items.addAll(duplicateItems);
//     });
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child:TextField(
              controller: filtro,
              onChanged: (value) {
  //  filterSearchResults(value);
},
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)
                  )
                )
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: widget.registros.length,
              itemBuilder: (BuildContext context, int index) {
                widget.registros[index].maxPrice == null ? widget.registros[index].maxPrice = 'sin precio':widget.registros[index].maxPrice;
                widget.registros[index].productDescription == null ? widget.registros[index].productDescription = 'sin descripcion':widget.registros[index].productDescription;
                return GestureDetector(
                  onTap: (){
                    showDialog(
                    context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(widget.registros[index].product),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage(widget.registros[index].image)),
                                Text('Precio unitario: ' + f.format(double.parse(double.parse(widget.registros[index].maxPrice).toStringAsFixed(2)))),
                                Text('Ubicacion de la empresa: ' + widget.registros[index].empresa),
                                Text('Stock actual: ' + widget.registros[index].currentStock),
                                Text('tipo de producto: ' + widget.registros[index].type),
                                Text('Categoria: '+ widget.registros[index].category),
                                Text('marca: ' + widget.registros[index].brand),
                                Text('Sku: ' + widget.registros[index].sku),
                                Text(widget.registros[index].productDescription),
                              ],
                            ),
                          ),
                        );
                    }
                    );
                  },
                  child: Container(
                    
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 0.1,
                        child:Row(
                          children: <Widget>[

                            Container(
                              margin: EdgeInsets.all(3),
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                child: Image(
                                  fit: BoxFit.fill,
                                  alignment: Alignment.centerRight,
                                  image: NetworkImage(widget.registros[index].image),
                                ),
                              ),
                            ),
                            Container(
                              
                              alignment: Alignment.topLeft,
                              width: 70,
                              margin: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(widget.registros[index].product, style: TextStyle( fontSize: 6),),
                                  Text(widget.registros[index].productDescription, style: TextStyle( fontSize: 4)),
                                  Text(double.parse(widget.registros[index].maxPrice).toStringAsFixed(2),style: TextStyle( fontSize: 6,),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
