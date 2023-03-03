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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var document =
      '<html><ol><li>Masukkan&nbsp;<span style="font-weight: bolder;">ID (SERVER)</span></li><li>Pilih&nbsp;<span style="font-weight: bolder;">Nominal&nbsp;</span>Diamond</li><li>Pilih&nbsp;<span style="font-weight: bolder;">Metode Pembayaran</span></li><li>Tulis&nbsp;<span style="font-weight: bolder;">nomor WhatsApp</span>&nbsp;yg benar!</li><li>Klik&nbsp;<span style="font-weight: bolder;">Beli&nbsp;</span>&amp; lakukan Pembayaran</li><li>Diamond akan masuk otomatis ke akun anda</li></ol></html>';
  // print(document.outerHtml);
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
          builder: (context, state) {
            switch (state.homeStateStatus) {
              case HomeStateStatus.loading:
                return Component.loading();
              case HomeStateStatus.success:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      BannerAdvertiseView(),
                      const SizedBox(
                        height: 20,
                      ),
                      Component.text(
                        "Top Up",
                        fontWeight: FontWeight.bold,
                        colors: ColorPalette.black,
                        fontSize: 20
                      ),
                      HtmlWidget(document),
                      Container(
                        height: 10,
                        width: 20,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: ColorPalette.primary,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / 1.5),
                          crossAxisCount: 4,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5
                        ),
                        itemCount: state.listCategory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Component.text(
                                  state.listCategory[index].nama ?? "",
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  colors: ColorPalette.blackText
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
                                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      child: Component.text("Top Up", colors: ColorPalette.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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
