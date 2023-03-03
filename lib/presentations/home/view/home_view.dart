import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanninstore/presentations/component/component.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state.homeStateStatus) {
              case HomeStateStatus.loading:
                return Component.loading();
              case HomeStateStatus.success:
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.listCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Component.text(
                      state.listCategory[index].nama ?? ""
                    );
                  },
                ); 
              default:
                return Container();
            }
          },
        ),
      )
    );
  }
}