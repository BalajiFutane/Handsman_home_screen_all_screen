
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/setting_screen.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';


import 'package:nb_utils/nb_utils.dart';


class ProfileFragment extends StatefulWidget {
  @override
  ProfileFragmentState createState() => ProfileFragmentState();
}

class ProfileFragmentState extends State<ProfileFragment> {
  // Dummy data variables
  bool isLoggedIn = true;
  bool isLoading = false;
  String userProfileImage = 'https://randomuser.me/api/portraits/men/1.jpg';
  String userFullName = 'John Doe';
  String userEmail = 'john.doe@example.com';
  double userWalletAmount = 1250.50;
  bool isDarkMode = false;

  // Configuration flags
  bool isEnableUserWallet = true;
  bool blogStatus = true;
  bool helpDeskStatus = true;
  String privacyPolicy = 'https://example.com/privacy';
  String termConditions = 'https://example.com/terms';
  String refundPolicy = 'https://example.com/refund';
  String helpAndSupport = 'https://example.com/support';
  String helplineNumber = '+1 234 567 8900';

  @override
  void initState() {
    super.initState();
    // Simulate initialization
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void logout(BuildContext context) {
    setState(() {
      isLoggedIn = false;
      isLoading = false;
    });
    toast('Logged out successfully');
  }

  void login() {
    setState(() {
      isLoggedIn = true;
      isLoading = false;
      userProfileImage = 'https://randomuser.me/api/portraits/men/1.jpg';
      userFullName = 'John Doe';
      userEmail = 'john.doe@example.com';
      userWalletAmount = 1250.50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(

      appBarTitle: "Profile Screen",
     appnavcolor: primaryColor,


       actions: [
         IconButton(
           icon: Icon(Icons.settings, color: Colors.white),
           onPressed: () {
             toast('Settings clicked');
             SettingScreen().launch(context);
           },
         ),

     ],

     child : Stack(

        children: [
          AnimatedScrollView(
            padding: EdgeInsets.only(bottom: 32),
            children: [
              if (isLoggedIn)
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radius(),
                    backgroundColor: isDarkMode ? context.cardColor : lightPrimaryColor,
                    // backgroundColor: appStore.isDarkMode ? context.cardColor : lightPrimaryColor,
                    border: Border.all(color: primaryColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(userProfileImage),
                                radius: 35,
                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  decoration: boxDecorationDefault(
                                    color: primaryColor,
                                    border: Border.all(color: primaryLightColor, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text('Edit', style: secondaryTextStyle(color: Colors.white, size: 12)),
                                ).onTap(() {
                                  toast('Edit profile clicked');
                                }),
                              ),
                            ],
                          ),
                          24.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Marquee(child: Text(userFullName, style: boldTextStyle(color: primaryColor, size: 16))),
                              Marquee(child: Text(userEmail, style: secondaryTextStyle())),
                            ],
                          ).expand(),
                        ],
                      ).paddingOnly(left: 16, top: 16, bottom: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                          color: primaryColor,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.account_balance_wallet, color: Colors.white),
                            8.width,
                            Text('Wallet Balance', style: boldTextStyle(color: Colors.white)).onTap(() {
                              if (isEnableUserWallet) {
                                toast('Wallet balance clicked');
                              }
                            }),
                            Spacer(),
                            Text('\$${userWalletAmount.toStringAsFixed(2)}', style: boldTextStyle(color: Colors.white)),
                          ],
                        ).paddingAll(16),
                      ).visible(isEnableUserWallet),
                    ],
                  ),
                ).paddingOnly(left: 16, right: 16, top: 24),

              // General Settings Section
              SettingSection(
                title: Text('GENERAL', style: boldTextStyle(color: primaryColor)),
                divider: Offstage(),
                headingDecoration: BoxDecoration(color: context.primaryColor.withOpacity(0.1), borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16))),

                headerPadding: EdgeInsets.only(bottom: 14, right: 14, left: 16, top: 14),
                items: [
                  if (isLoggedIn && isEnableUserWallet)
                    SettingItemWidget(
                      // decoration: BoxDecoration(color: context.cardColor),
                      decoration: BoxDecoration(color: context.cardColor),
                      leading: Icon(Icons.account_balance_wallet, size: 20),
                      title: 'Wallet History',
                      titleTextStyle: boldTextStyle(size: 12),
                      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        toast('Wallet history clicked');
                      },
                    ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.favorite, size: 20),
                    title: 'Favorite',
                    titleTextStyle: boldTextStyle(size: 12),
                    trailing: Icon(Icons.chevron_right),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      isLoggedIn
                          ? toast('Favorites clicked')
                          : toast('Please login first');
                    },
                  ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.star, size: 20),
                    title: 'Rate Us',
                    titleTextStyle: boldTextStyle(size: 12),
                    trailing: Icon(Icons.chevron_right),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      toast('Rate us clicked');
                    },
                  ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.reviews, size: 20),
                    title: 'My Reviews',
                    titleTextStyle: boldTextStyle(size: 12),
                    trailing: Icon(Icons.chevron_right),
                    padding: isLoggedIn
                        ? EdgeInsets.only(bottom: isLoggedIn ? 0 : 16, top: 20, left: 16, right: 16)
                        : EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 20),
                    onTap: () {
                      isLoggedIn
                          ? toast('My reviews clicked')
                          : toast('Please login first');
                    },
                  ),
                  if (isLoggedIn && helpDeskStatus)
                    SettingItemWidget(
                      decoration: BoxDecoration(color: context.cardColor),
                      leading: Icon(Icons.help, size: 20),
                      title: 'Help Desk',
                      titleTextStyle: boldTextStyle(size: 12),
                      trailing: Icon(Icons.chevron_right),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 20),
                      onTap: () {
                        toast('Help desk clicked');
                      },
                    ),
                  SettingItemWidget(
                    decoration: BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(16))
                    ),
                    title: '',
                    titleTextStyle: boldTextStyle(size: 0),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    padding: EdgeInsets.only(bottom: 6, right: 16, left: 16, top: 6),
                    onTap: () {},
                  ),
                ],
              ).paddingAll(16),

              // About App Section
              SettingSection(
                title: Text('ABOUT APP', style: boldTextStyle(color: primaryColor)),

                divider: Offstage(),
                  headingDecoration: BoxDecoration(color: context.primaryColor.withOpacity(0.1), borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16))),

                    headerPadding: EdgeInsets.only(bottom: 14, right: 14, left: 16, top: 14),
                items: [
                  8.height,
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.info, size: 20),
                    title: 'About App',
                    titleTextStyle: boldTextStyle(size: 12),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      toast('About app clicked');
                    },
                  ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.privacy_tip, size: 20),
                    title: 'Privacy Policy',
                    titleTextStyle: boldTextStyle(size: 12),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      toast('Privacy policy clicked');
                    },
                  ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.description, size: 20),
                    title: 'Terms & Conditions',
                    titleTextStyle: boldTextStyle(size: 12),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      toast('Terms clicked');
                    },
                  ),
                  SettingItemWidget(
                    decoration: BoxDecoration(color: context.cardColor),
                    leading: Icon(Icons.money_off, size: 20),
                    title: 'Refund Policy',
                    titleTextStyle: boldTextStyle(size: 12),
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    onTap: () {
                      toast('Refund policy clicked');
                    },
                  ),
                  if (helpAndSupport.isNotEmpty)
                    SettingItemWidget(
                      decoration: BoxDecoration(color: context.cardColor),
                      leading: Icon(Icons.help_center, size: 20),
                      title: 'Help & Support',
                      titleTextStyle: boldTextStyle(size: 12),
                      padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                      onTap: () {
                        toast('Help & support clicked');
                      },
                    ),
                  if (helplineNumber.isNotEmpty)
                    SettingItemWidget(
                      decoration: !isLoggedIn
                          ? BoxDecoration(color: context.cardColor)
                          : BoxDecoration(
                          color: context.cardColor,
                          borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(16))
                      ),
                      leading: Icon(Icons.call, size: 20),
                      title: 'Helpline Number',
                      titleTextStyle: boldTextStyle(size: 12),
                      padding: EdgeInsets.only(
                          bottom: isLoggedIn ? 16 : 0,
                          right: 16,
                          left: 16,
                          top: 20
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        toast('Calling helpline');
                      },
                    ),
                  SettingItemWidget(

                    // decoration: !isLoggedIn
                        // ? BoxDecoration(
                        // color: context.cardColor,
                        // borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(16))
                        //     : BoxDecoration(color: context.cardColor),),
                    decoration: !isLoggedIn
                        ? BoxDecoration(color: context.cardColor)
                        : BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(16))
                    ),
                    leading: Icon(Icons.login, size: 20),
                    title: 'Sign In',
                    titleTextStyle: boldTextStyle(size: 12),
                    onTap: login,
                  ).visible(!isLoggedIn),
                ],
              ).paddingSymmetric(horizontal: 16),

              // Danger Zone Section
              if (isLoggedIn)
                SettingSection(
                  title: Text('DANGER ZONE', style: boldTextStyle(color: Colors.red, size: 14)),
                  // headerPadding: EdgeInsets.only(bottom: 14, right: 14, left: 16, top: 14),
                  // divider: Offstage(),

                  divider: Offstage(),
                  headingDecoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16))),

                  headerPadding: EdgeInsets.only(bottom: 14, right: 14, left: 16, top: 14),
                  items: [
                    8.height,
                    SettingItemWidget(
                      decoration: BoxDecoration(
                          color: context.cardColor,
                          borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(16))
                      ),
                      leading: Icon(Icons.delete, size: 20, color: Colors.red),
                      paddingBeforeTrailing: 4,
                      title: 'Delete Account',
                      titleTextStyle: boldTextStyle(size: 12),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        showConfirmDialogCustom(
                          context,
                          negativeText: 'Cancel',
                          positiveText: 'Delete',
                          onAccept: (_) {
                            setState(() => isLoggedIn = false);
                            toast('Account deleted (demo)');
                          },
                          dialogType: DialogType.DELETE,
                          title: 'Are you sure you want to delete your account?',
                        );
                      },
                    ),
                    64.height,
                    TextButton(
                      child: Text('Logout', style: boldTextStyle(color: primaryColor, size: 16)),
                      onPressed: () => logout(context),
                    ).center(),
                  ],
                ).paddingOnly(left: 16, right: 16, top: 16),

              30.height.visible(!isLoggedIn),
              TextButton(
                child: Text('v1.0.0', style: secondaryTextStyle()),
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Demo App',
                    applicationVersion: '1.0.0',
                    applicationIcon: FlutterLogo(size: 50),
                  );
                },
              ).center(),
            ],
          ),
          if (isLoading) LoaderWidget().center(),
        ],
      ),
    );
  }
}

// Helper function to show toast messages
void toast(String message) {
  // In a real app, you would use Fluttertoast or similar
  debugPrint(message);
}