import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanninstore/domain/models/categories.dart';
import 'package:sanninstore/domain/models/product.dart';
import 'package:sanninstore/domain/repository/product_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {

  Categories categories;
  
  ProductDetailCubit({required this.categories}) : super(const ProductDetailState()){
    onGetProduct();
  }

  Future onGetProduct() async {
    var products = await ProductRepository.products(categories.kode ?? "");
    emit(state.copyWith(
      listProduct: products,
      categories: categories,
      productDetailStateStatus: ProductDetailStateStatus.success
    ));
  }

  onClikProduct(String kode) {
    emit(state.copyWith(productCode: kode));
  }

}
