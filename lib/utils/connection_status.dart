import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionStatus {
  // Return true if internet connection is found on device
  static Future<bool> isConnected() async {
    // var connectionResult = await (Connectivity().checkConnectivity());

    var connectionResult2 = await InternetConnectionChecker().hasConnection;

    if (connectionResult2 == true) {
      return true;
    } else {
      return false;
    }
  }
}
