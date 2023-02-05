import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

openBrowserTab() async {
    FlutterWebBrowser.openWebPage(
      url:
          "https://widget.tryterra.co/session/1b2a5412-a915-4bc2-9132-c69bacd64ca6",
      customTabsOptions: const CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        shareState: CustomTabsShareState.on,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: const SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.blue,
        preferredControlTintColor: Colors.amber,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }


  