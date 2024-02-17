import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/authenticated_user.dart';
import 'models/role.dart';
import 'models/user.dart';

class Authentication {
  static final _singleton = Authentication._internal();

  factory Authentication() {
    return _singleton;
  }

  Authentication._internal();

  final _keyAuthenticatedUser = "keyAuthenticatedUser";
  AuthenticatedUser? _authenticatedUser;

  AuthenticatedUser? get authenticatedUser => _authenticatedUser;

  bool get isAuthenticated => _authenticatedUser?.token != null;

  User? get user => _authenticatedUser?.user;

  // Role get role => user?.role ?? Role.GUEST;
  Role get role =>
      // _authenticatedUser?.token != null ? Role.CUSTOMER : Role.GUEST;
      (_authenticatedUser?.token != null)
          ? (_authenticatedUser?.user?.role == Role.DRIVER)
              ? Role.DRIVER
              : (_authenticatedUser?.user?.role == Role.VENDOR)
                  ? Role.VENDOR
                  : Role.CUSTOMER
          : Role.GUEST;

  String get token => _authenticatedUser?.token ?? "";

  List<String>? get nameList => _authenticatedUser?.user?.name?.split(" ");

  Future<void> init() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      final authenticatedUserJsonString =
          sharedPreferences.getString(_keyAuthenticatedUser);

      if (authenticatedUserJsonString != null) {
        _authenticatedUser = AuthenticatedUser.fromJson(
          jsonDecode(authenticatedUserJsonString) as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint("Authentication:init:Exception:$e");
    }
  }

  Future<void> saveAuthenticatedUser({
    required AuthenticatedUser? authenticatedUser,
  }) async {
    try {
      _authenticatedUser = authenticatedUser;
        print("AuthenticatedUser :${_authenticatedUser?.user}");
        print("AuthenticatedUser :${_authenticatedUser}");

      if (authenticatedUser != null) {
        (await SharedPreferences.getInstance()).setString(
          _keyAuthenticatedUser,
          jsonEncode(_authenticatedUser!.toJson()),
        );
      } else {
        (await SharedPreferences.getInstance()).remove(_keyAuthenticatedUser);
      }
    } catch (e) {
      debugPrint(
        "Authentication:saveAuthenticatedUser:Exception:$e",
      );
    }
  }

  Future<void> setAuthenticatedUser([
    AuthenticatedUser? authenticatedUser,
  ]) async {
    try {
      _authenticatedUser = authenticatedUser;

      if (authenticatedUser != null) {
        (await SharedPreferences.getInstance()).setString(
          _keyAuthenticatedUser,
          jsonEncode(_authenticatedUser!.toJson()),
        );
      } else {
        (await SharedPreferences.getInstance()).remove(_keyAuthenticatedUser);
      }
    } catch (e) {
      debugPrint(
        "Authentication:saveAuthenticatedUser:Exception:$e",
      );
    }
  }

  Future<void> clearAuthenticatedUser() async {
    try {
      await saveAuthenticatedUser(authenticatedUser: null);
    } catch (e) {
      debugPrint(
        "Authentication:clearAuthenticatedUser:Exception:$e",
      );
    }
  }
}

final authentication = Authentication();
