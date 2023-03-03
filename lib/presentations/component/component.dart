import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sanninstore/core/app/app.dart';

class Component {

  static final Component _singleton = Component._internal();

  factory Component() {
    return _singleton;
  }

  Component._internal();

  static Text text(
    String content,
    {Color colors = Colors.black54,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start,
    String fontFamily = Constant.montserratRegular,
    FontStyle? fontStyle
  }) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // static InputDecoration decorationBorder(String label, {String? hintText, IconData? iconData, IconData? suffixIcon}) => InputDecoration(
  //   prefixIcon: iconData != null ? Padding(
  //     padding: const EdgeInsets.all(17.0),
  //     child: Icon(iconData, color: ColorPalette.grey),
  //   ) : null,
  //   suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: ColorPalette.grey) : null,
  //   hintText: 'xxxxx',
  //   hintStyle: const TextStyle(
  //     color: ColorPalette.grey,
  //     fontSize: 12,
  //   ),
  //   // labelStyle: const TextStyle(color: ColorPalette.primary),
  //   labelText: label,
  //   fillColor: ColorPalette.primary,
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: const BorderSide(color: ColorPalette.grey),
  //   ),
  //   focusedErrorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: const BorderSide(color: ColorPalette.grey),
  //   ),
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: const BorderSide(color: ColorPalette.grey),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: const BorderSide(color: ColorPalette.primary),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: const BorderSide(color: ColorPalette.grey),
  //   ),
  // );

  // static decorationNoBorder(String hint, {IconData? iconPrefix}) => InputDecoration(
  //   fillColor: ColorPalette.grey.withAlpha(30),
  //   filled: true,
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
  //     borderRadius: BorderRadius.circular(10)
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
  //     borderRadius: BorderRadius.circular(10)
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
  //   ),
  //   disabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.0),
  //     borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
  //   ),
  //   prefixIcon: iconPrefix != null ? Icon(
  //     iconPrefix,
  //     color: ColorPalette.primary,
  //     size: 30,
  //   ) : null,
  //   counterText: "",
  //   hintText: hint,
  //   contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  //   hintStyle: const TextStyle(fontSize: 12.0, color: ColorPalette.textGrey, fontWeight: FontWeight.w500)
  // );

  static button({required String label, required VoidCallback? onPressed, Color color = ColorPalette.primary}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onPressed: onPressed,
      child: Container(
        // width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static divider ({
    double height = 5.0, 
    Color color = ColorPalette.greyBorder,
    double thickness = 1
  })=> Divider(
    height: height,
    thickness: thickness,
    // indent: 20,
    // endIndent: 0,
    color: color,
  );
  
  static toast(String message, {Color color = Colors.transparent}){
    BotToast.showText(
      text: message,
      contentColor: ColorPalette.white,
      textStyle: const TextStyle(
        color: ColorPalette.black, 
        fontWeight: FontWeight.bold,
        fontFamily: Constant.montserratRegular
      )
    );
  }

}