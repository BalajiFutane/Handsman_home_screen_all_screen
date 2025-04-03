
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';


class MaintenanceModeScreen extends StatelessWidget {

  final  isDarkMode=false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            // appStore.isDarkMode ? 'assets/lottie/maintenance_mode_dark.json' : 'assets/lottie/maintenance_mode_light.json',
            "assets/icon/maintenance_mode_light.json",
            height: 300,
          ),
          Text("language.lblUnderMaintenance", style: boldTextStyle(size: 18), textAlign: TextAlign.center).center(),
          8.height,
          Text("language.lblCatchUpAfterAWhile", style: secondaryTextStyle(), textAlign: TextAlign.center).center(),
          16.height,
          TextButton(
            onPressed: () async {
              // await setValue(LAST_APP_CONFIGURATION_SYNCED_TIME, 0);
              // await getAppConfigurations();
              RestartAppWidget.init(context);
            },
            child: Text("language.lblRecheck"),
          ),
        ],
      ),
    );
  }
}
