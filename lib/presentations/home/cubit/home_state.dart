part of 'home_cubit.dart';

enum HomeStateStatus {loading, success}

class HomeState extends Equatable {

  final HomeStateStatus homeStateStatus;
  final List<Categories> listCategory;

  const HomeState({
    this.homeStateStatus = HomeStateStatus.loading,
    this.listCategory = const []
  });

  @override
  List<dynamic> get props => [
    homeStateStatus,
    listCategory
  ];
  
  HomeState copyWith({
    HomeStateStatus? homeStateStatus,
    List<Categories>? listCategory
  }){
    return HomeState(
      homeStateStatus: homeStateStatus ?? this.homeStateStatus,
      listCategory: listCategory ?? this.listCategory
    );
  }

}
