
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/Productos_api.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProductosWidget extends StatelessWidget {

  final SharedPreferences empresa;
  final List<ProductosApi> registros;

  ProductosWidget({@required this.registros, this.empresa});
 


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: registros.length,
        itemBuilder: (BuildContext context, int index) {
          registros[index].alertQuantity == null ? registros[index].alertQuantity = 'sin precio':registros[index].alertQuantity;
          registros[index].productDescription == null ? registros[index].productDescription = 'sin descripcion':registros[index].productDescription;
          return GestureDetector(
            onTap: (){
              showDialog(
              context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(registros[index].name),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          FadeInImage(placeholder: AssetImage('assets/imagenes/jar-loading.gif'), image: NetworkImage(registros[index].image)),
                          Text(registros[index].alertQuantity),
                          Text(registros[index].productDescription)
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
                        width: 30,
                        height: 25,
                        child: ClipRRect(
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.centerRight,
                            image: NetworkImage(registros[index].image),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: 70,
                        margin: EdgeInsets.all(3),
                        child: Column(
                          children: [
                            Text(registros[index].name, style: TextStyle( fontSize: 5),),
                            Text(registros[index].name, style: TextStyle( fontSize: 5),),
                            
                            
                          ],
                        ),
                      ),
                      Container(
                         width: 20,
                        child: Text(registros[index].alertQuantity,style: TextStyle( fontSize: 5)),

                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
