import 'dart:convert';
import 'package:flutter_login_ui/utilities/Facturas_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FacturasProvider {
  SharedPreferences empresa;
  String url1 = 'efectivo.com.do';
  List<FacturasApi> registros = [];

  Future<List<FacturasApi>> tomarDatos() async {
    String _url = 'efectivo.com.do';
    empresa = await SharedPreferences.getInstance();
    var empre = empresa.getString('businessId');
    final url = Uri.https(_url, '/Api/public/api/transactions/'+ empre);
    var response = await http.get(url);
    var jsonDta = json.decode(response.body);
    for (jsonDta in jsonDta) {
      registros.add(FacturasApi.fromJson(jsonDta));
    }
    return registros;
  }

}
