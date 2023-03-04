import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/domain/models/categories.dart';
import 'package:sanninstore/domain/repository/product_repository.dart';
import 'package:sanninstore/presentations/component/component_dialog.dart';
import 'package:sanninstore/presentations/home/cubit/product_detail_cubit.dart';
import 'package:sanninstore/presentations/home/view/product_detail_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()){
    onGetCategory();
  }

  List<Categories> categoryList = [];

  onGetCategory() async {
    categoryList.addAll(await ProductRepository.categories());
    CoreFunction.logPrint("Response", categoryList.toString());
    emit(state.copyWith(listCategory: categoryList, homeStateStatus: HomeStateStatus.success));
    ComponentDialog.dialog();
  }

  onNavDetail(Categories categories) {
    routePush(BlocProvider(
      create: (context) => ProductDetailCubit(categories: categories),
      child: const ProductDetialView(),
    ), RouterType.fade);
  }

  onSearch(String value){
    CoreFunction.debouncer.debounce(() {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.loading));
      if (value.isNotEmpty || value != "") {
        List<Categories> listTemp = [...categoryList];
        listTemp.removeWhere((element) => !element.nama!.toLowerCase().contains(value.toLowerCase()));
        emit(state.copyWith(listCategory: listTemp, homeStateStatus: HomeStateStatus.success));
      } else {
        CoreFunction.logPrint("Category", categoryList);
        emit(state.copyWith(listCategory: categoryList, homeStateStatus: HomeStateStatus.success));
      }
    });
  }

}
