import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/domain/models/categories.dart';
import 'package:sanninstore/domain/repository/product_repository.dart';
import 'package:sanninstore/presentations/home/cubit/product_detail_cubit.dart';
import 'package:sanninstore/presentations/home/view/product_detail_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()){
    onGetCategory();
  }

  onGetCategory() async {
    var response = await ProductRepository.categories();
    CoreFunction.logPrint("Response", response.toString());
    emit(state.copyWith(listCategory: response, homeStateStatus: HomeStateStatus.success));
  }

  onNavDetail(Categories categories) {
    routePush(BlocProvider(
      create: (context) => ProductDetailCubit(categories: categories),
      child: const ProductDetialView(),
    ), RouterType.fade);
  }

}
