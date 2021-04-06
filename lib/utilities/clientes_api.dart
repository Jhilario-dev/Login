class ClientesApi {
  String id;
  String name;
  String direccion;
  String telefono;
  String monto;
  String pendiente;


  ClientesApi({ 
    this.id,
    this.name,
    this.direccion, 
    this.telefono, 
    this.monto, 
    this.pendiente
  });

  ClientesApi.fromJson(Map<String, dynamic> json) {
    id = json['name'];
    name = json['name'];
    direccion = json['business_id'].toString();
    telefono = json['alert_quantity'];
    monto = json['image'];
    pendiente = json['product_description'];
  }
}
