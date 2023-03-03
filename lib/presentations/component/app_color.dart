class AppColor {

  static final AppColor _singleton = AppColor._internal();

  factory AppColor() {
    return _singleton;
  }

  AppColor._internal();

  // static Color notificationCardBoder(String? type){
  //   switch (type?.toLowerCase()) {
  //     case "belanja":
  //       return ColorPalette.gradint2;
  //     case "info":
  //       return ColorPalette.purpleBorder;
  //     case "promo":
  //       return ColorPalette.yellowBorder;
  //     default:
  //       return ColorPalette.grey;
  //   }
  // }

  // static String notificationCardIcon(String? type){
  //   switch (type?.toLowerCase()) {
  //     case "belanja":
  //       return "assets/icons/ic_order.png";
  //     case "info":
  //       return "assets/icons/ic_info.png";
  //     case "promo":
  //       return "assets/icons/ic_promo.png";
  //     default:
  //       return "assets/icons/ic_order.png";
  //   }
  // }

  // static String specialOfferIcon(SpecialOfferType specialOfferType) {
  //   switch (specialOfferType) {
  //     case SpecialOfferType.discount:
  //       return "assets/icons/ic_offer_delivery.png";
  //     case SpecialOfferType.shipping:
  //       return "assets/icons/ic_offer_discount.png";
  //     default:
  //       return "assets/icons/ic_offer_discount.png";
  //   }
  // }

  // static String transactionIcon(String transactionType) {
  //   switch (transactionType) {
  //     case "marketing_reward":
  //       return "assets/icons/ic_transaction_point.png";
  //     case "TransactionType.rabbani":
  //       return "assets/icons/ic_transaction_rabbani.png";
  //     case "shop_purchase":
  //       return "assets/icons/ic_transaction_store.png";
  //     default:
  //       return "";
  //   }
  // }

}