import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanninstore/domain/models/categories.dart';
import 'package:sanninstore/domain/models/payment_method.dart';
import 'package:sanninstore/domain/models/product.dart';
import 'package:sanninstore/domain/repository/product_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {

  Categories categories;
  
  ProductDetailCubit({required this.categories}) : super(const ProductDetailState()){
    onGetProduct();
  }

  List<PaymentMethod> paymwntMethodBanks = [
    PaymentMethod(key: 'bca', image: "assets/images/bca.png"),
    PaymentMethod(key: 'bnc', image: "assets/images/bnc.png"),
    PaymentMethod(key: 'danamon', image: "assets/images/danamon.png"),
    PaymentMethod(key: 'ocbc', image: "assets/images/ocbc.png"),
    PaymentMethod(key: 'bsi', image: "assets/images/bsi.png"),
    PaymentMethod(key: 'cimb', image: "assets/images/cimb.png"),
    PaymentMethod(key: 'sinarmas', image: "assets/images/sinarmas.png"),
    PaymentMethod(key: 'mandiri', image: "assets/images/mandiri.png"),
    PaymentMethod(key: 'bri', image: "assets/images/bri.png"),
    PaymentMethod(key: 'bni', image: "assets/images/bni.png"),
    PaymentMethod(key: 'permata', image: "assets/images/permata.png"),
    PaymentMethod(key: 'qris', image: "assets/images/qris.png"),
  ];
  
  List<PaymentMethod> paymwntMethodEmoneys = [
    PaymentMethod(key: 'ovo', image: "assets/images/ovo.png"),
    PaymentMethod(key: 'shopeepay', image: "assets/images/shopeepay.png"),
  ];
  
  List<PaymentMethod> paymentMethodStores = [
    PaymentMethod(key: 'indomaret', image: "assets/images/indomaret.png"),
    PaymentMethod(key: 'alfamart', image: "assets/images/alfamart.png")
  ];

  Future onGetProduct() async {
    var products = await ProductRepository.products(categories.kode ?? "");
    emit(state.copyWith(
      listProduct: products,
      categories: categories,
      paymentMethodBanks: paymwntMethodBanks,
      paymentMethodEmoneys: paymwntMethodEmoneys,
      paymentMethodStores: paymentMethodStores,
      productDetailStateStatus: ProductDetailStateStatus.success
    ));
  }

  onClikProduct(String kode) {
    emit(state.copyWith(productCode: kode));
  }
    onClikPaymentMethod(String kode) {
    emit(state.copyWith(paymentMethodCode: kode));
  }

}
