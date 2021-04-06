class ProductosApi {
  String product;
  String type;
  String image;
  String productDescription;
  String category;
  String unit;
  String brand;
  String sku;
  String tax;
  String currentStock;
  String maxPrice;
  String minPrice;
  String empresa;


  ProductosApi({
    this.product,
    this.type,
    this.image,
    this.productDescription,
    this.category,
    this.unit,
    this.brand,
    this.sku,
    this.tax,
    this.currentStock,
    this.maxPrice,
    this.minPrice,
    this.empresa
  });

  ProductosApi.fromJson(Map<String, dynamic> json) {
    product = json['product'] == null ?  product = 'sin nombre': product = json['product'];
    type = json['type'] == null ?  type = 'sin tipo': type = json['type'];
    productDescription = json['product_description'] == null ? productDescription= 'sin descripcion' : productDescription = json['product_description'];
    category = json['category'] == null ? category = 'sin categoria' : category = json['category'];
    unit = json['unit'] == null ? unit = 'desconocido' : unit = json['unit'];
    brand = json['brand'] == null ? brand= 'desconocido' :  brand = json['brand'];
    sku = json['tax'] == null ? sku= 'desconocido' :sku = json['tax'] ;
    tax = json['sku'] == null ? tax= 'desconocido' :tax = json['sku'] ;
    currentStock = json['current_stock'] == null ? currentStock= 'desconocido' : currentStock = json['current_stock'];
    maxPrice = json['max_purchase_price'] == null ? maxPrice = 'desconocido' :maxPrice = json['max_purchase_price'] ;
    minPrice = json['min_purchase_price'] == null ? minPrice = 'desconocido' :minPrice = json['min_purchase_price'] ;
    empresa = json['nombre_empresa']== null ? empresa = 'desconocido': empresa = json['nombre_empresa'];
    if (json['image'] == null ) {
      image = 'https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png';
    }else{
      image = 'https://efectivo.com.do/efectivo/public/uploads/img/' +json['image'];
    }
  }
}
