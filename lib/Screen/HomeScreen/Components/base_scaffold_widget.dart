import 'package:flutter/material.dart';

// Constants
const double APP_BAR_TEXT_SIZE = 18.0;

// Dummy `appStore` class to simulate loading behavior
class AppStore {
  bool isLoading = false;

  get isDarkMode => null;
}

final appStore = AppStore();

/// Dummy method to simulate `finish(context)` functionality
void finish(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

/// Back Button Widget
class BackWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? iconColor;

  BackWidget({this.onPressed, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => finish(context),
      icon: Icon(Icons.arrow_back, color: iconColor ?? Colors.white),
    );
  }
}

/// Loader Widget
class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

/// Body Widget with Loader
class Body extends StatelessWidget {
  final Widget child;
  final bool showLoader;

  const Body({Key? key, required this.child, this.showLoader = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          if (showLoader && appStore.isLoading)
            Center(child: LoaderWidget()),
        ],
      ),
    );
  }
}

/// **AppScaffold Component** (No Name Change)
class AppScaffold extends StatelessWidget {
  final String? appBarTitle;
  final List<Widget>? actions;
  final Widget child;
  final Color? scaffoldBackgroundColor;
  final Widget? bottomNavigationBar;
  final bool showLoader;

  final Color? appnavcolor;

  AppScaffold({
    this.appBarTitle,
    required this.child,
    this.actions,
    this.scaffoldBackgroundColor,
    this.bottomNavigationBar,
    this.showLoader = true,

    this.appnavcolor,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null
          ? AppBar(
        title: Text(appBarTitle ?? '', style: TextStyle(fontSize: APP_BAR_TEXT_SIZE, fontWeight: FontWeight.bold, color: Colors.white)),
        elevation: 0.0,
        backgroundColor: appnavcolor, // Use your primary color
        leading: Navigator.canPop(context) ? BackWidget() : null,
        // leading: showBackButton && Navigator.canPop(context) ? BackWidget(iconColor: Colors.black) : null,


        actions: actions,

      )
          : null,
      backgroundColor: scaffoldBackgroundColor ?? Colors.white,
      body: Body(child: child, showLoader: showLoader),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
