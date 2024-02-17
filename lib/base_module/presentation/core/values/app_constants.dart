class AppConstants {
  static const appName = "Lumiere Organics";
  static const appCaption = "";

  static const cornerRadius = 20.0;
  static const cornerRadiusMin = 10.0;
  static const smallCornerRadius = 6.0;
  static const cornerRadiuscircle = 50.0;
  static const cornerRadiusLarge = 16.0;
  static const defaultPadding = 20.0;
  static const elevation = 0.0;
  static const appVersion = "1.0.0";

  //breakpoints
  static const breakPointMobile = 500;

  // IMPORTANT- SAME KEY IS ALSO DEFINED IN ios/Runner/AppDelegate.swift and android/app/src/main/AndroidManifest.xml
  // ref : https://pub.dev/packages/google_maps_place_picker
  static const gmapsApiKey = "AIzaSyB8BFCKO8ehLV4_I6gNGQH7980Y896hVsk";
  static const playstoreUrl =
      'https://play.google.com/store/apps/details?id=in.lumiereorganics.app';
  static const appStoreUrl =
      'https://play.google.com/store/apps/details?id=in.lumiereorganics.app';

  static const filesUrl =
      // "https://homey-dev-files.s3.me-south-1.amazonaws.com/";
      // "https://blockat-dev-files.s3.me-south-1.amazonaws.com/";
      // "https://armino-ecomm.s3.ap-south-1.amazonaws.com/";
      // "https://lumiere-staging-uploads.s3.ap-south-1.amazonaws.com/";//// old lumiere url
      "https://d6ta5s1oamqul.cloudfront.net/"; ////// lumiere live file url

  static const dummyImage = "https://i.imgur.com/9pXdDf7.png";

  //region urls
  // const domain = "3.109.180.96:8087";//////// fresh original domain
  // const domain = "65.2.120.131:8089";//////// choice domain
  // const domain = "http://freshh.armino.in";
  static const _isLive = false;
  // true;

  static const testLink = "arjunprakash.mywire.org:8084";

  static const _domainLive = "api.lumiereorganics.in"; //lumiere live

  static const _domain = //"api.lumiereorganics.in:8083"; //lumiere staging
      "13.200.59.102:8093"; // sokhra staging

  static const httpLinkUrl =
      _isLive ? "https://$_domainLive/graphql" : "http://$_domain/graphql";

  static const wsLinkUrl =
      _isLive ? "wss://$_domainLive/graphql" : "ws://$_domain/graphql";

  static const _razorpayTestKey = "rzp_test_6OHVNyKV3Mku7J";

  static const _razorpayLiveKey = "rzp_live_TrkN7cMBm5ELRt";

  static const razorpayKey = _isLive ? _razorpayLiveKey : _razorpayTestKey;
//endregion
}
