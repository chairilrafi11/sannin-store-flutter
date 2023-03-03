import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sanninstore/core/app/app.dart';
import 'package:sanninstore/core/util/size_config.dart';
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

}