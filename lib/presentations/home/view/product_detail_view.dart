import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sanninstore/core/app/color_palette.dart';
import 'package:sanninstore/core/app/constant.dart';
import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/domain/models/payment_method.dart';
import 'package:sanninstore/presentations/component/badge_decoration.dart';
import 'package:sanninstore/presentations/component/component.dart';
import 'package:sanninstore/presentations/component/image_usecase.dart';
import 'package:sanninstore/presentations/component/text_usecase.dart';
import 'package:sanninstore/presentations/home/cubit/product_detail_cubit.dart';

class ProductDetialView extends StatelessWidget {
  const ProductDetialView({Key? key}) : super(key: key);

  final int maxWIdth = 1200;
  
  int countTotalGrid(double width) {
    if (width >= Constant.maxWIdth) {
      return 5;
    } else if (width >= 600){
      return 4;
    } else if (width >= 400){
      return 4;
    } else {
      return 2;
    }
  }

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
      backgroundColor: ColorPalette.whiteBackground,
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (contextState, state) {
          switch (state.productDetailStateStatus) {
            case ProductDetailStateStatus.loading:
              return Component.loading();
            case ProductDetailStateStatus.success:
              return LayoutBuilder(
                builder: (context, constraints) {
                  double width = constraints.maxWidth;
                  double padding = (width - maxWIdth) / 3;
                  return ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: (width > maxWIdth) ? padding : 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  border: Border.all(
                                    color: ColorPalette.primary,
                                    width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 10,),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                        ),
                                        child: Image.asset(
                                          ImageUsecase.imageProduct(state.categories?.kode),
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Component.text(
                                        state.categories?.nama ?? "",
                                        textAlign: TextAlign.center,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        colors: ColorPalette.blackText
                                      ),
                                      const SizedBox(height: 20,),
                                      HtmlWidget(TextUsecase.guideProduct(state.categories?.kode)),
                                      const SizedBox(height: 20,),
                                      Component.text(
                                        "Buka 24 Jam",
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        colors: ColorPalette.primary
                                      ),
                                      const SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  const SizedBox(height: 10,),
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        border: Border.all(
                                          color: ColorPalette.primary,
                                          width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                                decoration: const BoxDecoration(
                                                  color: ColorPalette.red,
                                                  shape: BoxShape.circle
                                                ),
                                                child: Component.text(
                                                  "1",
                                                  fontFamily: Constant.montserratBold,
                                                  fontSize: 25,
                                                  colors: ColorPalette.white
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Component.text(
                                                "Lengkapi Data",
                                                textAlign: TextAlign.center,
                                                fontFamily: Constant.montserratBold,
                                                fontSize: 25,
                                                colors: ColorPalette.blackText
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 10,
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: ColorPalette.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(height: 40,),
                                          Component.text(
                                            "User ID",
                                            colors: ColorPalette.blackText
                                          ),
                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            decoration: Component.decorationNoBorder('Masukan User ID'),
                                          ),
                                          const SizedBox(height: 20,),
                                          Component.text(
                                            "Server ID",
                                            colors: ColorPalette.blackText
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
                                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                              child: Component.text("Petunjuk", colors: ColorPalette.white),
                                            ),
                                          ),
                                          const SizedBox(height: 10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        border: Border.all(
                                          color: ColorPalette.primary,
                                          width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                                decoration: const BoxDecoration(
                                                  color: ColorPalette.red,
                                                  shape: BoxShape.circle
                                                ),
                                                child: Component.text(
                                                  "2",
                                                  fontFamily: Constant.montserratBold,
                                                  fontSize: 25,
                                                  colors: ColorPalette.white
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Component.text(
                                                "Pilih Nominal",
                                                textAlign: TextAlign.center,
                                                fontFamily: Constant.montserratBold,
                                                fontSize: 25,
                                                colors: ColorPalette.blackText
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 10,
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: ColorPalette.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                          Flexible(
                                            child: GridView.builder(
                                              shrinkWrap: true,                                     
                                              physics: const NeverScrollableScrollPhysics(),
                                              padding: const EdgeInsets.symmetric(horizontal: 0),
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: (1 / 0.6),
                                                crossAxisCount: countTotalGrid(width),
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5
                                              ),
                                              itemCount: state.listProduct.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                bool chose = state.productCode == state.listProduct[index].productCode;
                                                return InkWell(
                                                  onTap: () => contextState.read<ProductDetailCubit>().onClikProduct(state.listProduct[index].productCode ?? ""),
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: chose ? ColorPalette.red : ColorPalette.greyBackground,
                                                      // border: Border.all(
                                                      //   width: 1,
                                                      //   color: ColorPalette.primary
                                                      // ),
                                                      borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Image.asset(
                                                            ImageUsecase.product(state.categories?.kode, state.listProduct[index].hargaGold!.toDouble()),
                                                            height: double.infinity,
                                                            width: double.infinity,
                                                            fit: BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Component.text(
                                                                state.listProduct[index].layanan ?? "",
                                                                textAlign: TextAlign.center,
                                                                fontWeight: FontWeight.bold,
                                                                maxLines: 4,
                                                                fontSize: 12,
                                                                colors: chose ? ColorPalette.white : ColorPalette.blackText
                                                              ),
                                                              const SizedBox(height: 10,),
                                                              Component.text(
                                                                CoreFunction.moneyFormatter(state.listProduct[index].hargaSilver),
                                                                textAlign: TextAlign.center,
                                                                fontSize: 12,
                                                                maxLines: 4,
                                                                // fontWeight: FontWeight.bold,
                                                                fontFamily: Constant.montserratBold,
                                                                colors: chose ? ColorPalette.white : ColorPalette.blackText
                                                              ),
                                                            ],
                                                          ),
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
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        border: Border.all(
                                          color: ColorPalette.primary,
                                          width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                                decoration: const BoxDecoration(
                                                  color: ColorPalette.red,
                                                  shape: BoxShape.circle
                                                ),
                                                child: Component.text(
                                                  "3",
                                                  fontFamily: Constant.montserratBold,
                                                  fontSize: 25,
                                                  colors: ColorPalette.white
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Component.text(
                                                "Metode Pembayaran",
                                                textAlign: TextAlign.center,
                                                fontFamily: Constant.montserratBold,
                                                fontSize: 25,
                                                colors: ColorPalette.blackText
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 10,
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: ColorPalette.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                          Component.text(
                                            "Emoneys",
                                            textAlign: TextAlign.center,
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 20,
                                            colors: ColorPalette.blackText
                                          ),
                                          const SizedBox(height: 10,),
                                          paymentMethods(state.paymentMethodEmoneys, contextState, state.paymentMethodCode),
                                          const SizedBox(height: 20,),
                                          Component.text(
                                            "Bank",
                                            textAlign: TextAlign.center,
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 20,
                                            colors: ColorPalette.blackText
                                          ),
                                          const SizedBox(height: 10,),
                                          paymentMethods(state.paymentMethodBanks, contextState, state.paymentMethodCode),
                                          const SizedBox(height: 20,),
                                          Component.text(
                                            "Convience Store",
                                            textAlign: TextAlign.center,
                                            fontFamily: Constant.montserratBold,
                                            fontSize: 20,
                                            colors: ColorPalette.blackText
                                          ),
                                          const SizedBox(height: 10,),
                                          paymentMethods(state.paymentMethodStores, contextState, state.paymentMethodCode),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        border: Border.all(
                                          color: ColorPalette.primary,
                                          width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                                decoration: const BoxDecoration(
                                                  color: ColorPalette.red,
                                                  shape: BoxShape.circle
                                                ),
                                                child: Component.text(
                                                  "4",
                                                  fontFamily: Constant.montserratBold,
                                                  fontSize: 25,
                                                  colors: ColorPalette.white
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Component.text(
                                                "Beli",
                                                textAlign: TextAlign.center,
                                                fontFamily: Constant.montserratBold,
                                                fontSize: 25,
                                                colors: ColorPalette.blackText
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 10,
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: ColorPalette.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(height: 40,),
                                          Component.text(
                                            "No Whatsapp",
                                            colors: ColorPalette.blackText
                                          ),
                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            decoration: Component.decorationNoBorder('Masukan no whatsapp'),
                                          ),
                                          const SizedBox(height: 50,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Component.toast("On Progress mase"),
                                    child: Container(
                                      alignment: Alignment.center,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorPalette.primary,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.add_shopping_cart, color: Colors.white,),
                                          const SizedBox(width: 10,),
                                          Component.text("Beli Pesanan", colors: ColorPalette.white),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 100,),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      const SizedBox(height: 50,),
                      Component.footer()
                    ],
                  );
                }
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget paymentMethods(List<PaymentMethod> listPaymentMethod, BuildContext contextState, String paymentMethodCode) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1 / 0.5),
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      ),
      itemCount: listPaymentMethod.length,
      itemBuilder: (context, index){
        bool chose = paymentMethodCode == listPaymentMethod[index].key;
        return InkWell(
          onTap: () => contextState.read<ProductDetailCubit>().onClikPaymentMethod(listPaymentMethod[index].key) ,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            foregroundDecoration: chose ? const BadgeDecoration(
              badgeColor:  ColorPalette.primary,
              badgeSize: 30,
              textSpan: TextSpan(
                text: '✓',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ) : null,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              border: Border.all(
                color: chose ? ColorPalette.primary : ColorPalette.grey.withAlpha(100),
                width: 2
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: chose ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ] : [],
            ),
            child: Image.asset(
              listPaymentMethod[index].image,
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
    );
  }

}