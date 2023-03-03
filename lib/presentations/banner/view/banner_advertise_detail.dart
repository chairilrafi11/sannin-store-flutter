// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pajang_customer/core/core.dart';
// import 'package:pajang_customer/ui/banner/model/response_banner.dart';
// import 'package:pajang_customer/ui/component/component.dart';
// import 'package:pajang_customer/ui/component/component_widget.dart';

// class BannerAdvertiseDetailView extends StatelessWidget {

//   final Banners? banners;

//   const BannerAdvertiseDetailView({Key? key, required this.banners}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: FireshipPalette.white,
//       appBar: Component.appBarDefault(title: "Detail Banner"),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: FireshipConstant.paddingHorizontalScreen),
//         child: ListView(
//           children: [
//             const SizedBox(height: 20,),
//             ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               child: CachedNetworkImage(
//                 imageUrl: banners!.imageUrl!,
//                 fit: BoxFit.fill,
//                 width: 1000.0,
//                 placeholder: (context, url) => ComponentWidget.shimmerBanner(),
//                 errorWidget: (context, url, error) => Image.asset(
//                   "assets/images/banner_0.png",
//                   fit: BoxFit.cover,
//                   width: SizeConfig.blockSizeHorizontal * 100,
//                   height: SizeConfig.blockSizeHorizontal * 40,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20,),
//             Component.textBold(banners?.name ?? "", textAlign: TextAlign.center),
//             const SizedBox(height: 20,),
//             Component.textDefault(banners?.description ?? "", maxLines: 20,)
//           ],
//         ),
//       )
//     );
//   }
// }
