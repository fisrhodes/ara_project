import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnection() async {
  final connectivity = Connectivity();
  var connectionResult = await connectivity.checkConnectivity();
  return connectionResult == ConnectivityResult.wifi ||
      connectionResult == ConnectivityResult.mobile;
}
