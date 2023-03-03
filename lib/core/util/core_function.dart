import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app/app_config.dart';
import 'debouncer.dart';

class CoreFunction {
  static final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk

  static Debouncer debouncer = Debouncer(delay: const Duration(seconds: 1));

  static void logPrint(String tag, dynamic log) {
    if (AppConfig.debug) {
      pattern
          .allMatches("$tag => $log")
          .forEach((match) => debugPrint(match.group(0)));
    }
  }

  static String moneyFormatter(dynamic value) {
    double price = double.tryParse(value.toString()) ?? 0;
    var idr =
    NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp");
    return idr.format(price);
  }
  
  static String numberFormatter(dynamic value) {
    var f = NumberFormat.compact(locale: 'id_ID');
    return f.format(value);
  }

  static Future<bool> checkConnectivity() async {
    // bool connect = false;
    // try {
    //   final result = await InternetAddress.lookup('google.com')
    //       .timeout(const Duration(seconds: 10));
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     connect = true;
    //   }
    // } on SocketException catch (_) {
    //   connect = false;
    // }
    // return connect;
    return true;
  }

  static int totalCrossAxixCount(double maxWidth){
    if (maxWidth < 400) {
      return 2;
    } else if (maxWidth < 500) {
      return 3;
    } else if (maxWidth < 600) {
      return 4;
    } else {
      return 5;
    }
  }

  // static showToast(String message, {int duration = 3, int position = 1, Color backgroundColor = ColorPalette.red}) {
  //   Flushbar(
  //     margin: const EdgeInsets.all(8),
  //     borderRadius: BorderRadius.circular(8),
  //     duration: Duration(seconds: duration),
  //     backgroundColor: backgroundColor,
  //     icon: const Icon(Icons.error_outline, color: ColorPalette.white),
  //     // message: message,
  //     messageText: Text(
  //       message,
  //       style: const TextStyle(
  //         color: ColorPalette.white,
  //       ),
  //       maxLines: 3,
  //     ),
  //   ).show(navGK.currentContext!);
  // }

  // static launchURL(String url) async {
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     Component.toastInfo("Tidak dapat membuka url");
  //     throw 'Could not launch $url';
  //   }
  // }
  
  // static launchWhatsapp() async {
  //   var whatsapp = "+628112370111";
  //   var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp");
  //   if (await canLaunchUrl(whatsappAndroid)) {
  //       await launchUrl(whatsappAndroid);
  //   } else {
  //     Component.toastInfo("Tidak dapat membuka url");
  //   }
  // }

  static String version() {
    if (Platform.isAndroid) {
      return AppConfig.appsVersionAndroid;
    } else if (Platform.isIOS) {
      return AppConfig.appsversionIos;
    } else {
      return "";
    }
  }

}
