import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class Network {
  static final _instance = Network.internal();

  factory Network() {
    return _instance;
  }

  Network.internal();

  final _connectivity = Connectivity();

  Future<bool> get isOnline async => _isOnline();

  Future<bool> _isOnline() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        if (kIsWeb) {
          return true; //html.window.navigator.onLine;
        } else {
          final result = await InternetAddress.lookup("google.com");

          if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
            return true;
          }
        }
      }
    } catch (e) {
      debugPrint("Network:_isOnline:Exception:$e");
    }

    return false;
  }
}

final network = Network();
