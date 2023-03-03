// import 'package:chairil/domain/database/address/address_box_controller.dart';
// import 'package:chairil/domain/database/auth/auth_box.dart';

// import '../../domain/database/address/address_box.dart';

// class AuthService {

//   static final AuthService _singleton = AuthService._internal();

//   factory AuthService() {
//     return _singleton;
//   }

//   AuthService._internal();

//   static late AuthBox _authBox; 
//   static AddressBox? _addressBox;
//   static bool _isLogin = false;

//   static AuthBox get authBox => _authBox;
//   static bool get isLogin => _isLogin;
//   static AddressBox? get addressBox => _addressBox;

//   static setAuthBox(AuthBox newAuth) {
//     _authBox = newAuth;
//     setLogin(true);
//   }

//   static setAddressBox(AddressBox value) {
//     _addressBox = value;
//   }

//   static setAddressFromDatabase() async {
//     var address = await AddressBoxController.load();
//     if(address.isNotEmpty) _addressBox = address.first;
//   }

//   static removeAddress() => _addressBox = null;

//   static setLogin(bool value) => _isLogin = value;

// }