import 'package:permission_handler/permission_handler.dart';

class PermissionRequest {
  late final PermissionStatus _smsPermission;

  init() async {
    _smsPermission = await Permission.sms.status;
    if (_smsPermission != PermissionStatus.granted) {
      await Permission.sms.request();
    }
  }

  PermissionStatus get smsPermission => _smsPermission;
}

final permissionRequest = PermissionRequest();
