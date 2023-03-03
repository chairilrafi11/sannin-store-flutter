import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sanninstore/core/app/color_palette.dart';
import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/presentations/component/component.dart';
import 'package:sanninstore/presentations/component/image_usecase.dart';
import 'package:sanninstore/presentations/component/text_usecase.dart';
import 'package:sanninstore/presentations/home/cubit/product_detail_cubit.dart';

class ProductDetialView extends StatelessWidget {
  const ProductDetialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            switch (state.productDetailStateStatus) {
              case ProductDetailStateStatus.loading:
                return Component.loading();
              case ProductDetailStateStatus.success:
                return ListView(
                  children: [
                    const SizedBox(height: 10,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                              ),
                              child: Image.asset(
                                ImageUsecase.imageProduct(state.categories?.kode),
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Component.text(
                              state.categories?.nama ?? "",
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                              colors: ColorPalette.blackText
                            ),
                            const SizedBox(height: 20,),
                            HtmlWidget(TextUsecase.guideProduct(state.categories?.kode)),
                            const SizedBox(height: 10,),
                            Component.text(
                              "Buka 24 Jam",
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                              colors: ColorPalette.primary
                            ),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Component.text(
                              "Lengkapi Data",
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                              colors: ColorPalette.blackText
                            ),
                            const SizedBox(height: 20,),
                            Component.text(
                              "User ID",
                              colors: ColorPalette.white
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              decoration: Component.decorationNoBorder('Masukan User ID'),
                            ),
                            const SizedBox(height: 10,),
                            Component.text(
                              "Server ID",
                              colors: ColorPalette.white
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              decoration: Component.decorationNoBorder('Masukan Server ID'),
                            ),
                            const SizedBox(height: 10,),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorPalette.primary,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Component.text("Petunjuk", colors: ColorPalette.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Component.text(
                              "Pilih Nominal",
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                              colors: ColorPalette.blackText
                            ),
                            const SizedBox(height: 10,),
                            Flexible(
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  // childAspectRatio: (1 / 1.5),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5
                                ),
                                itemCount: state.listProduct.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.red,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Component.text(
                                            state.listProduct[index].layanan ?? "",
                                            textAlign: TextAlign.center,
                                            // fontWeight: FontWeight.bold,
                                            colors: ColorPalette.white
                                          ),
                                          const SizedBox(height: 10,),
                                          Component.text(
                                            CoreFunction.moneyFormatter(state.listProduct[index].hargaSilver),
                                            textAlign: TextAlign.center,
                                            // fontWeight: FontWeight.bold,
                                            colors: ColorPalette.white
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                );
              default:
                return Container();
            }
          },
        )
      ),
    );
  }
}