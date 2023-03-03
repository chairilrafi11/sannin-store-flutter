import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  
  BannerCubit() : super(const BannerState());

  setDot(int index) => emit(state.copyWith(curentDot: index));

}
