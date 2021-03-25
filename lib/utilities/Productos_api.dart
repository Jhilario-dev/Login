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
    if (json['image'] == null ) {
      image = 'https://i0.wp.com/www.frentecreativo.com/wp-content/uploads/2019/07/photo_2019-07-03_17-38-20.jpg?fit=1280%2C720&ssl=1';
    }else{
      image = 'https://efectivo.com.do/efectivo/public/uploads/img/' +json['image'];
    }
    productDescription = json['product_description'];
  }
}
