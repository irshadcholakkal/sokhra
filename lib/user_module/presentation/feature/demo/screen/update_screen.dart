import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/util/util.dart';

class UpdateScreen extends StatelessWidget {
  // final UpdateConfig? updateConfig;

  const UpdateScreen({
    Key? key,
    // required this.updateConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppIconLarge(),
              const AppPadding(dividedBy: 3),
              Text("update"),
              const AppPadding(dividedBy: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (Platform.isIOS) {
                      util.launchUrl("");
                    } else if (Platform.isAndroid) {
                      util.launchUrl(AppConstants.playstoreUrl);
                    }
                  },
                  child: Text('To use this app, download latest version'
                      // translation.of('update'),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
