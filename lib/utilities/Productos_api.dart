class ProductosApi {
  String name;
  String alertQuantity;
  String image;
  String productDescription;

  ProductosApi(
      {this.name, this.productDescription, this.image, this.alertQuantity});

  ProductosApi.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alertQuantity = json['alert_quantity'];
    image = json['image'];
    productDescription = json['product_description'];
  }
}
