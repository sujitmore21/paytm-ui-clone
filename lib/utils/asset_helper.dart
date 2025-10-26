class assetsHelper {
  // Base path for assetss
  static const String _basePath = 'assets/';

  // Paytm Icons
  static const String paytmLogo144 = '${_basePath}icons8-paytm-144.svg';
  static const String paytmLogo96 = '${_basePath}icons8-paytm-96.svg';
  static const String paytmLogo48 = '${_basePath}icons8-paytm-48.svg';

  // Other Icons
  static const String bhimIcon = '${_basePath}icons8-bhim.svg';
  static const String loveIcon = '${_basePath}icons8-love-48.png';

  // Helper method to get the appropriate Paytm logo based on size
  static String getPaytmLogo({int size = 48}) {
    switch (size) {
      case 144:
        return paytmLogo144;
      case 96:
        return paytmLogo96;
      case 48:
      default:
        return paytmLogo48;
    }
  }
}
