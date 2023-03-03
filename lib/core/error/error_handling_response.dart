

import 'package:sanninstore/core/util/util.dart';
import 'package:sanninstore/domain/models/error_response.dart';
import 'package:sanninstore/presentations/component/component.dart';

class ErrorHandlingResponse {
  final Errors errors;
  final bool showMessage;

  ErrorHandlingResponse({required this.errors, this.showMessage = true});

  Future checkErrror() async {
    CoreFunction.logPrint("Error Code", errors.code);
    switch (errors.code) {
      case 400:
        if(showMessage) Component.toast(errors.detail ?? "");
        break;
      case 401:
        Component.toast("Not authorized");
        break;
      default:
        Component.toast(errors.detail ?? "");
    }
  }
}
