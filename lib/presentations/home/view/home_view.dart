import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sanninstore/core/app/app.dart';
import 'package:sanninstore/core/util/size_config.dart';
import 'package:sanninstore/presentations/banner/cubit/banner_cubit.dart';
import 'package:sanninstore/presentations/banner/view/banner_advertise_view.dart';
import 'package:sanninstore/presentations/component/component.dart';
import 'package:sanninstore/presentations/component/image_usecase.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  int countTotalGrid(double width) {
    if (width >= 800) {
      return 5;
    } else if (width >= 600){
      return 4;
    } else {
      return 3;
    }
  }

  double getButonMargin (double width) {
    switch (countTotalGrid(width)) {
      case 5:
        return (800 / 90);
      case 4:
        return (width / 80);
      default:
        return (width / 60);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        centerTitle: true,
        title: Component.text(
          "SANNIN STORE",
          fontWeight: FontWeight.bold,
          fontSize: 25,
          colors: ColorPalette.white
        ),
        actions: [
           PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context){
            return [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Text("My Account"),
                  ),

                  PopupMenuItem<int>(
                      value: 1,
                      child: Text("Settings"),
                  ),

                  PopupMenuItem<int>(
                      value: 2,
                      child: Text("Logout"),
                  ),
              ];
          },
          onSelected:(value){
            if(value == 0){
                print("My account menu is selected.");
            }else if(value == 1){
                print("Settings menu is selected.");
            }else if(value == 2){
                print("Logout menu is selected.");
            }
          }
        ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => BannerCubit(),
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (contextState, state) {
            switch (state.homeStateStatus) {
              case HomeStateStatus.loading:
                return Component.loading();
              case HomeStateStatus.success:
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    double padding = (width - 800) / 2;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: (width > 800) ? padding : 0),
                      child: ListView(
                      children: [
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: BannerAdvertiseView()
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Component.text(
                            "Top Up",
                            fontWeight: FontWeight.bold,
                            colors: ColorPalette.black,
                            fontSize: 20
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 20,
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          color: ColorPalette.primary,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 1.5),
                            crossAxisCount: countTotalGrid(width),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5
                          ),
                          itemCount: state.listCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (() =>  contextState.read<HomeCubit>().onNavDetail(state.listCategory[index])),
                              child: Card(
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                        ),
                                        child: Image.asset(
                                          ImageUsecase.imageProduct(state.listCategory[index].kode),
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Component.text(
                                          state.listCategory[index].nama ?? "",
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.bold,
                                          colors: ColorPalette.blackText
                                        )
                                      )
                                    ),
                                    // Expanded(
                                    //   flex: 1,
                                    //   child: InkWell(
                                    //     child: Container(
                                    //       alignment: Alignment.center,
                                    //       width: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //         color: ColorPalette.primary,
                                    //         borderRadius: BorderRadius.circular(10)
                                    //       ),
                                    //       margin: EdgeInsets.symmetric(vertical: getButonMargin(width), horizontal: 10),
                                    //       padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                    //       child: Component.text("Top Up", colors: ColorPalette.white),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 50,),
                        Component.footer()
                      ],
                    ),
                    );
                  }
                );
              default:
                return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.primary,
        child: Icon(Icons.contact_support),
        onPressed: (){
          Component.toastNotification("Ahohoyyy");
        }
      ),
    );
  }
}
