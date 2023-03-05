import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sanninstore/core/app/app.dart';

import 'jumping_dots.dart';

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

  static loading(){
    return const Center(
      child: JumpingDots()  
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

  static decorationNoBorder(String hint, {IconData? iconPrefix}) => InputDecoration(
    fillColor: ColorPalette.grey.withAlpha(30),
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorPalette.primary),
      borderRadius: BorderRadius.circular(10)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorPalette.primary),
      borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
    ),
    prefixIcon: iconPrefix != null ? Icon(
      iconPrefix,
      color: ColorPalette.primary,
      size: 30,
    ) : null,
    counterText: "",
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    hintStyle: const TextStyle(fontSize: 12.0, color: ColorPalette.textGrey, fontWeight: FontWeight.w500)
  );

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
  
  static toastNotification(String message, {Color color = Colors.transparent}){
    BotToast.showNotification(
      backgroundColor: ColorPalette.white,
      
      // textStyle: const TextStyle(
      //   color: ColorPalette.black, 
      //   fontWeight: FontWeight.bold,
      //   fontFamily: Constant.montserratRegular
      // ),
    );
  }

  static footer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: ColorPalette.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.text(
                      "SANNIN STORE",
                      colors: ColorPalette.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                    const SizedBox(height: 20,),
                    Component.text(
                      "mau topup game murah, cepat, aman dan terpecaya? di sini tempatnya",
                      colors: ColorPalette.white
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.text(
                      "",
                      colors: ColorPalette.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                    const SizedBox(height: 20,),
                    Component.text(
                      "mau topup game murah, cepat, aman dan terpecaya? di sini tempatnya",
                      colors: ColorPalette.white
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: ColorPalette.primary,
          child: Component.text(
            "© 2023 Copyright SANNIN STORE",
            textAlign: TextAlign.center,
            colors: ColorPalette.white
          ),
        ),
      ],
    );
  }
  

}