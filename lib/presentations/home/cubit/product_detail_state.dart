part of 'product_detail_cubit.dart';

enum ProductDetailStateStatus {loading, initial, success}

class ProductDetailState extends Equatable {

  final Categories? categories;
  final String productCode;
  final String paymentMethodCode;
  final List<Product> listProduct;
  final List<PaymentMethod> paymentMethodStores;
  final List<PaymentMethod> paymentMethodBanks;
  final List<PaymentMethod> paymentMethodEmoneys;
  final ProductDetailStateStatus productDetailStateStatus;

  const ProductDetailState({
    this.categories,
    this.productCode = '',
    this.paymentMethodCode = '',
    this.listProduct = const  [],
    this.paymentMethodBanks = const [],
    this.paymentMethodEmoneys = const [],
    this.paymentMethodStores = const [],
    this.productDetailStateStatus = ProductDetailStateStatus.loading
  });

  @override
  List<dynamic> get props => [
    categories,
    productCode,
    paymentMethodCode,
    listProduct,
    paymentMethodBanks,
    paymentMethodEmoneys,
    paymentMethodStores,
    productDetailStateStatus
  ];

  ProductDetailState copyWith({
    Categories? categories,
    String? productCode,
    String? paymentMethodCode,
    List<Product>? listProduct,
    List<PaymentMethod>? paymentMethodStores,
    List<PaymentMethod>? paymentMethodBanks,
    List<PaymentMethod>? paymentMethodEmoneys,
    ProductDetailStateStatus? productDetailStateStatus
  }) {
    return ProductDetailState(
      categories: categories ?? this.categories,
      productCode: productCode ?? this.productCode,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      listProduct: listProduct ?? this.listProduct,
      paymentMethodBanks: paymentMethodBanks ?? this.paymentMethodBanks,
      paymentMethodEmoneys: paymentMethodEmoneys ?? this.paymentMethodEmoneys,
      paymentMethodStores: paymentMethodStores ?? this.paymentMethodStores,
      productDetailStateStatus: productDetailStateStatus ?? this.productDetailStateStatus
    );
  }

}
