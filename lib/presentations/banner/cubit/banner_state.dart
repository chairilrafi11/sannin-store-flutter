part of 'banner_cubit.dart';

enum BannerType {top, flash, center1, category, newProduct, center2}

class BannerState extends Equatable {

  final int curentDot;

  const BannerState({
    this.curentDot = 0
  });

  @override
  List<Object> get props => [curentDot];

  BannerState copyWith({
    int? curentDot
  }) {
    return BannerState(curentDot: curentDot ?? this.curentDot);
  }

}