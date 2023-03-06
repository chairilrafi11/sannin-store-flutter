import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sanninstore/core/app/app.dart';
import 'package:sanninstore/core/util/core_function.dart';
import 'package:sanninstore/core/util/size_config.dart';
import 'package:sanninstore/presentations/banner/cubit/banner_cubit.dart';
import 'package:sanninstore/presentations/banner/view/banner_advertise_view.dart';
import 'package:sanninstore/presentations/component/component.dart';
import 'package:sanninstore/presentations/component/image_usecase.dart';
import 'package:shimmer/shimmer.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late ScrollController _scrollController;

  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }

  int countTotalGrid(double width) {
    if (width >= Constant.maxWIdth) {
      return 5;
    } else if (width >= 600){
      return 4;
    }else if (width >= 375){
      return 3;
    } else {
      return 2;
    }
  }
  
  countAspecRatio(double width) {
    CoreFunction.logPrint("Aspec Ratio", width);
    if (width >= Constant.maxWIdth) {
      return (1/1);
    } else if (width >= 600){
      return (1/1.2);
    }  else if (width >= 450){
      return (1/1.4);
    } else {
      return (1/1.6);
    }
  }
  
  double fontSize(double width) {
    if (width >= Constant.maxWIdth) {
      return 15;
    } else if (width >= 600){
      return 15;
    } else if (width >= 400){
      return 12;
    }else {
      return 11;
    }
  }
  
  double imageSize(double height) {
    if (height >= Constant.maxWIdth) {
      return height / 2;
    } else if (height >= 600){
      return height / 2;
    } else {
      return height / 3;
    }
  }

  double getButonMargin (double width) {
    switch (countTotalGrid(width)) {
      case 5:
        return (Constant.maxWIdth / 90);
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
      backgroundColor: ColorPalette.whiteBackground2,
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
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    double padding = (width - Constant.maxWIdth) / 2;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: (width > Constant.maxWIdth) ? padding : 0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.white54,
                        highlightColor: Colors.white,
                        child: ListView(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10,),
                            Container(
                              width: double.infinity,                 
                              height: SizeConfig.blockSizeVertical * 25,
                              color: ColorPalette.grey,
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              width: double.infinity,                 
                              height: SizeConfig.blockSizeVertical * 10,
                              color: ColorPalette.grey,
                            ),                     
                            const SizedBox(height: 10,),
                            Flexible(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 15,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: countTotalGrid(width),
                                  childAspectRatio: countAspecRatio(width),
                                  mainAxisSpacing: 50,
                                  crossAxisSpacing: 10
                                ),
                                itemBuilder: (context, index){
                                  return LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints boxConstraints) {
                                    final height = boxConstraints.maxHeight;
                                    final width = boxConstraints.maxWidth;
                                    return Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: height,
                                          margin: EdgeInsets.only(top: height / 3),
                                          // padding: const EdgeInsets.only(top: 10),
                                          child: Card(
                                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      margin: const EdgeInsets.only(top: 10),
                                                      alignment: Alignment.center,
                                                    )
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: InkWell(
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorPalette.white,
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            height: height / 2,
                                            width: height / 2,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              case HomeStateStatus.success:
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    double padding = (width - Constant.maxWIdth) / 2;
                    return ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: (width > Constant.maxWIdth) ? padding : 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: BannerAdvertiseView()
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // SizedBox(height: 20,),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                child: TextFormField(
                                  decoration: Component.decorationNoBorder("Cari Produk"),
                                  onChanged: (value) => contextState.read<HomeCubit>().onSearch(value),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Component.text(
                                "Top Up",
                                // fontWeight: FontWeight.bold,
                                fontFamily: Constant.montserratExtraBold,
                                colors: ColorPalette.black,
                                textAlign: TextAlign.left,
                                fontSize: 30
                              ),
                            ),
                            Container(
                              height: 10,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              color: ColorPalette.primary,
                            ),
                            const SizedBox(height: 30),
                            Flexible(
                              child: GridView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: countTotalGrid(width),
                                  childAspectRatio: countAspecRatio(width),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 1
                                ),
                                children: state.listCategory.map((e){
                                  return  LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints boxConstraints) {
                                    final height = boxConstraints.maxHeight;
                                    final width = boxConstraints.maxWidth;
                                    return InkWell(
                                      onTap: (() =>  contextState.read<HomeCubit>().onNavDetail(e)),
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: height * 0.7,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.asset(
                                                        ImageUsecase.imageProduct(e.kode),
                                                        height: double.infinity,
                                                        // width: imageSize(height),
                                                        fit: BoxFit.fitHeight,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                                                      alignment: Alignment.bottomCenter,
                                                      child: Component.text(
                                                        e.nama ?? "",
                                                        fontSize: fontSize(width),
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.bold,
                                                        colors: ColorPalette.blackText
                                                      )
                                                    )
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: ColorPalette.primary,
                                                          borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        margin: const EdgeInsets.only(top:10, bottom: 10, left: 10, right: 10),
                                                        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                                        child: Component.text(
                                                          "Top Up", 
                                                          colors: ColorPalette.white,
                                                          fontSize: 12
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        ),
                        const SizedBox(height: 50,),
                        Component.footer()],
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
