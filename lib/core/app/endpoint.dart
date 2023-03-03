class Endpoint {

  //? Auth
  static const login               = 'oauth/user';
  static const check               = 'oauth/check';
  static const otp                 = 'oauth/fa_otp';
  static const signup              = 'oauth/fa_signup';
  static const register            = 'oauth/user_register';
  static const forgotPasswordOtp   = "oauth/user_forgot_password";
  static const forgotPasswordReset = "oauth/user_reset_password";
  static const qrUserCheck         = "oauth/qr_user_check";
  static const qruserverification  = "oauth/qr_user";

  //? Home
  static const category       = 'u/category/list';
  static const categoryDetail = 'u/category/detail/{id}';
  static const feeds          = 'u/feed/list';
  static const feedsComment   = 'u/feed/comments';
  static const flashSale      = 'u/flashsale/list';
  static const voucher        = 'u/voucher';
  static const voucherDetail  = 'u/voucher/{id}';
  static const slider         = 'u/slider/list';
  static const oneSignal      = 'u/me/onesignal';

  //? Product
  static const product           = 'u/product/list';
  static const recommended       = 'u/product/recommend';
  static const productDetail     = 'u/product/detail/{id}';
  static const productReview     = 'u/product/review/{id}';
  static const productLastView   = 'u/me/last_view';
  static const productAvailable  = 'u/product_detail/available_stores/{id}';

  //? Search
  static const searchKeyword   = '/u/search_keyword/list_popular';
  static const searchSimiliar  = '/u/search_keyword/similir_search';

  //? Cart
  static const cart           = 'u/cart';
  static const cartModify     = 'u/cart/modify';
  static const cartRemove     = 'u/cart/remove';
  static const cartStore      = '/u/cart/store_item';
  static const cartStoreSync  = 'u/cart/store_sync';

  //? User
  static const profile          = 'u/me'; 
  static const afiliate         = 'u/afiliate';
  static const afiliateJoin     = 'u/afiliate';
  static const afiliateHistory  = 'u/afiliate/history';
  static const profileUpdate    = 'u/me/update_profile';
  static const profilePicture   = 'u/me/update_profile_picture';
  static const resetPassword    = 'u/me/reset_password';
  static const updatePassword   = 'u/me/update_password';
  static const notifications    = 'u/me/notifications';

  //? Wishlist
  static const wishlist       = 'u/wishlist/list';
  static const wishlistAdd    = 'u/wishlist/wishlist/{id}';
  static const wishlistRemove = 'u/wishlist/unwishlist/{id}';

  //? Bank
  static const bank       = 'u/me/banks';
  static const bankAdd    = 'u/me/bank_profile';
  static const bankDetail = "u/me/bank_profile/{id}";
  static const bankUpdate = 'u/me/bank_profile/{id}';
  static const bankDelete = 'u/me/bank_profile/{id}';

  //? Address
  static const address       = 'client/member_address';
  static const addressAdd    = 'client/member_address';
  static const addressDetail = 'client/member_address/{id}';
  static const addressUpdate = 'client/member_address/{id}';
  static const addressDelete = 'client/member_address/{id}';

  //? Feeds
  static const feedList        = 'u/feed/list';
  static const feedCommentList = 'u/feed/comment/{id}';
  static const feedPost        = 'u/feed/post';
  static const feedComment     = 'u/feed/comment/{id}';
  static const feedLike        = 'u/feed/like/{id}';
  static const feedView        = 'u/feed/view/{id}';

  //? Catalog
  static const catalogList   = 'u/catalog/list';
  static const catalogDetail = 'u/catalog/list/{id}';

  //? Order
  static const orderList            = 'u/order/list';
  static const orderDetail          = 'u/order/detail/{id}';
  static const orderCheck           = 'u/order/check';
  static const orderCreate          = 'u/order';
  static const orderUpdateComplete  = 'u/order/update_to_completed/{id}';
  static const orderReCheckPayment  = 'u/order/recheck_payment_method/{id}';
  static const orderReCreatePayment = 'u/order/recreate_payment_method/{id}';
  static const orderCancel          = 'u/order/cancel/{id}';
  static const orderRate            = 'u/order/rate/{id}';
  static const orderRateReview      = 'u/order/rate_review/{id}';

  //? Paymet
  static const paymentCallback = 'payment/paymenttripay/callback';

  //? Location
  static const province = 'auth_api/location/province';
  static const city     = 'auth_api/location/district';
  static const distric  = 'auth_api/location/subdistrict';
  static const village  = 'auth_api/location/village';

  //? Store
  static const store = 'u/store/list_store';

  //? Service
  static const destination = 'auth_api/shipping/destination';
  static const shipping    = 'auth_api/shipping/ongkir';

}
