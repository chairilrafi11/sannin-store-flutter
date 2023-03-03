part of 'product_detail_cubit.dart';

enum ProductDetailStateStatus {loading, initial, success}

class ProductDetailState extends Equatable {

  final Categories? categories;
  final String productCode;
  final List<Product> listProduct;
  final ProductDetailStateStatus productDetailStateStatus;

  const ProductDetailState({
    this.categories,
    this.productCode = '',
    this.listProduct = const  [],
    this.productDetailStateStatus = ProductDetailStateStatus.loading
  });

  @override
  List<dynamic> get props => [
    categories,
    productCode,
    listProduct,
    productDetailStateStatus
  ];

  ProductDetailState copyWith({
    Categories? categories,
    String? productCode,
    List<Product>? listProduct,
    ProductDetailStateStatus? productDetailStateStatus
  }) {
    return ProductDetailState(
      categories: categories ?? this.categories,
      productCode: productCode ?? this.productCode,
      listProduct: listProduct ?? this.listProduct,
      productDetailStateStatus: productDetailStateStatus ?? this.productDetailStateStatus
    );
  }

}
