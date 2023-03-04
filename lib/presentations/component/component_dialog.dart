import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sanninstore/core/app/app.dart';
import 'package:sanninstore/core/util/size_config.dart';
import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/presentations/component/component.dart';
import 'package:sanninstore/presentations/component/jumping_dots.dart';

class ComponentDialog {
  
  static final ComponentDialog _singleton = ComponentDialog._internal();

  factory ComponentDialog() {
    return _singleton;
  }

  ComponentDialog._internal();
  
  static loading() {
    BotToast.showCustomLoading(
      clickClose: true, 
      toastBuilder: (void Function() cancelFunc) { 
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeHorizontal * 10, 
              horizontal: SizeConfig.blockSizeHorizontal * 10
            ),
            child: const JumpingDots()
          )  
        );
     },
    );
  }

  static dialog(){
    showDialog(
      context: navGK.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog( 
          title: Component.text(
            "Diskon buat kamu",
            colors: ColorPalette.black
          ),
          content: Image.asset(
            "assets/images/test.png",
            height: SizeConfig.blockSizeVertical * 50,
            width: SizeConfig.blockSizeVertical * 50,
          )
        );
      },
    );
  }

}