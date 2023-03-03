class Product {
  
  String? layanan;
  int? hargaGold;
  int? hargaSilver;
  String? productCode;

  Product({this.layanan, this.hargaGold, this.hargaSilver, this.productCode});

  Product.fromJson(Map<String, dynamic> json) {
    layanan = json['layanan'];
    hargaGold = json['harga_gold'];
    hargaSilver = json['harga_silver'];
    productCode = json['product_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['layanan'] = layanan;
    data['harga_gold'] = hargaGold;
    data['harga_silver'] = hargaSilver;
    data['product_code'] = productCode;
    return data;
  }
}
