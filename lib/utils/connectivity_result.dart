import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityService{
  StreamController<ConnectivityResult> connectionStatusController = StreamController<ConnectivityResult>();

  ConnectivityService(){
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
    });
  }
}