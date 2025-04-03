

import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Dummy data variables
  bool isLoginTypeUser = true;
  bool isLoggedIn = true;
  bool isLoading = false;
  bool autoSliderStatus = true;
  bool updateNotify = true;
  bool pushNotificationEnabled = true;
  bool useMaterialYouTheme = false;
  bool isAndroid12Above = true; // For demo purposes

  // Dummy icons (replace with your actual icon constants)
  final ic_lock = Icons.lock;
  final ic_language = Icons.language;
  final ic_dark_mode = Icons.dark_mode;
  final ic_slider_status = Icons.slideshow;
  final ic_check_update = Icons.system_update;
  final ic_notification = Icons.notifications;
  final ic_android_12 = Icons.android;
  final trailing = Icon(Icons.chevron_right);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(

      appnavcolor: primaryColor,
      appBarTitle: "App Setting",
      child: AnimatedScrollView(
        padding: EdgeInsets.symmetric(vertical: 8),
        // // listAnimationType: ListAnimationType.FadeIn,
        // fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
        children: [
          if (isLoginTypeUser)
            SettingItemWidget(
              // leading: Icon(ic_lock, size: SETTING_ICON_SIZE),
              title: 'Change Password',
              trailing: trailing,
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                if (isLoggedIn) {
                  // In real app: ChangePasswordScreen().launch(context);
                  toast('Change password clicked');
                } else {
                  toast('Please login first');
                }
              },
            ),
          SettingItemWidget(
            leading: Icon(ic_language, size: 17).paddingOnly(left: 2),
            paddingAfterLeading: 16,
            title: 'Language',
            trailing: trailing,
            titleTextStyle: primaryTextStyle(),
            onTap: () {
              // In real app: LanguagesScreen().launch(context);
              toast('Language selection clicked');
            },
          ),
          SettingItemWidget(
            leading: Icon(ic_dark_mode, size: 22),
            title: 'App Theme',
            paddingAfterLeading: 12,
            trailing: trailing,
            titleTextStyle: primaryTextStyle(),
            onTap: () async {
              // In real app: ThemeSelectionDialog
              toast('Theme selection clicked');
            },
          ),
          SettingItemWidget(
            // leading: Icon(ic_slider_status, size: SETTING_ICON_SIZE),
            title: 'Auto Slider Status',
            titleTextStyle: primaryTextStyle(),
            trailing: Transform.scale(
              scale: 0.7,
              child: Switch.adaptive(
                value: autoSliderStatus,
                onChanged: (v) {
                  setState(() => autoSliderStatus = v);
                  toast('Auto slider ${v ? 'enabled' : 'disabled'}');
                },
              ).withHeight(18),
            ),
          ),
          SettingItemWidget(
            // leading: Icon(ic_check_update, size: SETTING_ICON_SIZE),
            title: 'Update Notifications',
            titleTextStyle: primaryTextStyle(),
            trailing: Transform.scale(
              scale: 0.7,
              child: Switch.adaptive(
                value: updateNotify,
                onChanged: (v) {
                  setState(() => updateNotify = v);
                  toast('Update notifications ${v ? 'enabled' : 'disabled'}');
                },
              ).withHeight(18),
            ),
          ),
          if (isLoggedIn)
            SettingItemWidget(
              // leading: Icon(ic_notification, size: SETTING_ICON_SIZE),
              title: 'Push Notifications',
              titleTextStyle: primaryTextStyle(),
              trailing: Transform.scale(
                scale: 0.7,
                child: Switch.adaptive(
                  value: pushNotificationEnabled,
                  onChanged: (v) {
                    setState(() => pushNotificationEnabled = v);
                    toast('Push notifications ${v ? 'enabled' : 'disabled'}');
                  },
                ).withHeight(18),
              ),
            ),
          if (isAndroid12Above)
            SettingItemWidget(
              // leading: Icon(ic_android_12, size: SETTING_ICON_SIZE),
              title: 'Material You Theme',
              titleTextStyle: primaryTextStyle(),
              trailing: Transform.scale(
                scale: 0.7,
                child: Switch.adaptive(
                  value: useMaterialYouTheme,
                  onChanged: (v) {
                    // showConfirmDialogCustom(
                    //   context,
                    //   onAccept: (_) {
                    //     setState(() => useMaterialYouTheme = v);
                    //     toast('App restart required for changes');
                    //   },
                    //   title: 'Changing this setting requires app restart',
                    //   positiveText: 'Continue',
                    //   negativeText: 'Cancel',
                    // );
                  },
                ).withHeight(18),
              ),
              onTap: null,
            ),
        ],
      ),
    );
  }

  // Helper function to show toast messages
  void toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  // Simplified confirmation dialog
  Future<void> showConfirmDialogCustom({
    required BuildContext context,
    required String title,
    String positiveText = 'OK',
    String negativeText = 'Cancel',
    required Function(bool) onAccept,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            child: Text(negativeText),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text(positiveText),
            onPressed: () {
              onAccept(true);
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}



enum ListAnimationType { FadeIn, Slide }

class FadeInConfiguration {
  final Duration duration;

  const FadeInConfiguration({this.duration = const Duration(milliseconds: 500)});
}