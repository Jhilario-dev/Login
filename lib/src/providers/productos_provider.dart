import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_ui/utilities/Productos_api.dart';

class ProductosProvider {
  String url1 = 'efectivo.com.do';
  List<ProductosApi> registros = [];

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

}
