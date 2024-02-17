import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../base_module/presentation/component/appbar/simple_app_bar.dart';

class OurStoryScreen extends StatelessWidget {
  const OurStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Our story"),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://360vishnu.wixsite.com/lumiereorganics/ourstory",
          ),
        ),
      ),
    );
  }
}
