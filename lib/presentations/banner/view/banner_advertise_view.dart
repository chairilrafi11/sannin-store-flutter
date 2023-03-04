import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanninstore/core/app/color_palette.dart';
import 'package:sanninstore/core/app/constant.dart';
import 'package:sanninstore/core/util/size_config.dart';

import '../cubit/banner_cubit.dart';

class BannerAdvertiseView extends StatelessWidget {

  BannerAdvertiseView({Key? key}) : super(key: key);

  final List<String> listData = [
    "assets/images/banner_1.jpeg",
    "assets/images/banner_2.jpeg",
    "assets/images/banner_3.jpeg",
    "assets/images/banner_4.jpeg",
  ];

  double bannerSize (double width) {
    if (width < Constant.maxWIdth) {
      return width / 2.7;
    } else {
      return 450;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        return Column(
          // alignment: Alignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: bannerSize(MediaQuery.of(context).size.width),
                initialPage: 0,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                onPageChanged: (index, reason) => BlocProvider.of<BannerCubit>(context).setDot(index)
              ),
              items: listData.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      i,
                      fit: BoxFit.fill,
                      width: SizeConfig.blockSizeHorizontal * 100,
                      height: SizeConfig.blockSizeVertical * 25,
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: listData
                  .asMap()
                  .map((index, value) =>MapEntry(index, dot(state.curentDot, index, context)))
                  .values
                  .toList(),
              ),
            )
          ],
        );
      },
    );
  }

  Widget dot(int currentIndex, int index, BuildContext context) {
    return currentIndex == index
      ? const Icon(Icons.circle, color: ColorPalette.primary  , size: 20)
      : const Icon(Icons.horizontal_rule, color: ColorPalette.primary, size: 30);
  }
}
