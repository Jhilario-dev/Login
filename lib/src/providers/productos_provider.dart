import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_ui/utilities/Productos_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductosProvider {
  SharedPreferences empresa;
  String url1 = 'efectivo.com.do';
  List<ProductosApi> registros = [];

  Future<List<ProductosApi>> tomarDatos() async {
    String _url = 'efectivo.com.do';
    empresa = await SharedPreferences.getInstance();
    var empre = empresa.getString('businessId');
    final url = Uri.https(_url, '/Api/public/api/products/'+ empre);
    var response = await http.get(url);
    var jsonDta = json.decode(response.body);
    for (jsonDta in jsonDta) {
      registros.add(ProductosApi.fromJson(jsonDta));
    }
    return registros;
  }

}
