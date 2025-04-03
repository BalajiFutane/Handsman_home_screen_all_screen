


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/Comp/help_desk_item_component.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/empty_error_state_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../main.dart';

import 'add_help_desk_screen.dart';

// import 'model/help_desk_response.dart';

class HelpDeskListScreen extends StatefulWidget {
  @override
  _HelpDeskListScreenState createState() => _HelpDeskListScreenState();
}

class _HelpDeskListScreenState extends State<HelpDeskListScreen> {
  List<HelpDeskListData> helpDeskList = [];
  List<HelpDeskListData> filteredList = [];

  // Status Tab
  List<Map<String, dynamic>> helpDeskStatus = [];
  Map<String, dynamic> selectedTab = {};

  int page = 1;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    init();

    // Simulate live stream update
    // LiveStream().on(LIVESTREAM_UPDATE_HELP_DESK_LIST, (value) {
    //   page = 1;
    //   appStore.setLoading(true);
    //   filterHelpDeskList(status: value.toString());
    //   setState(() {});
    // });
  }

  void init() async {
    // Generate dummy data
    helpDeskList = List.generate(20, (index) {
      return HelpDeskListData(
        // id: index + 1,
        // title: "Help Desk Issue ${index + 1}",
        // description: "This is a detailed description of help desk issue number ${index + 1}",
        // status: index % 3 == 0 ? "open" : "closed",
        // createdAt: DateTime.now().subtract(Duration(days: index)).toDateString(),
        // updatedAt: DateTime.now().subtract(Duration(days: index)).toDateString(),
        id: index + 1,
        subject: "Help Desk Issue ${index + 1}",
        description: "I'm having trouble processing my payment for the recent booking.",
        createdAt: DateTime.now().toString(),
        status: index % 3 == 0 ? "open" : "closed",
        // createdAt: DateTime.now().subtract(Duration(days: index)).toDateString(),
        updatedAt: DateTime.now().subtract(Duration(days: index)).toString(),
      );
    });



    helpDeskStatus = [
      {"status": "all", "name": "Hello"},
      {"status": "open", "name": "MY DEAR"},
      {"status": "closed", "name": "language"},
    ];

    if (helpDeskStatus.isNotEmpty) {
      selectedTab = helpDeskStatus.first;
      filterHelpDeskList(status: selectedTab['status']);
    }
  }

  void filterHelpDeskList({String status = ""}) {
    // appStore.setLoading(true);

    Future.delayed(Duration(seconds: 1), () { // Simulate network delay
      if (status == "all") {
        filteredList = List.from(helpDeskList);
      } else {
        filteredList = helpDeskList.where((item) => item.status?.toLowerCase() == status.toLowerCase()).toList();
      }

      // appStore.setLoading(false);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "helpDesk",
      appnavcolor: primaryColor,
      actions: [
        IconButton(
          onPressed: () async {
            AddHelpDeskScreen(callback: (newItem) {
              // Add new dummy item
              helpDeskList.insert(0, HelpDeskListData(
                // id: helpDeskList.length + 1,
                // title: newItem.title ?? "New Issue",
                // description: newItem.description ?? "New description",
                // status: "open",
                // createdAt: DateTime.now().toDateString(),
                // updatedAt: DateTime.now().toDateString(),

                 id: helpDeskList.length + 1,
                subject: "Payment Issue",
                description: "I'm having trouble processing my payment for the recent booking.",
                createdAt: DateTime.now().toString(),
                updatedAt: DateTime.now().toString(),
                status: "OPEN", // Assuming OPEN is a constant defined in your code
              ));

              selectedTab = helpDeskStatus.first;
              filterHelpDeskList(status: selectedTab['status']);
              setState(() {});
            }).launch(context);
          },
          icon: Icon(Icons.add, size: 28, color: Colors.white),
        )
      ],
      showLoader: false,
      child: Stack(
        children: [
          Column(
            children: [
              16.height,
              Row(
                children: [
                  HorizontalList(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: helpDeskStatus.length,
                    itemBuilder: (ctx, index) {
                      var filterStatus = helpDeskStatus[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilterChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: radius(18),
                              side: BorderSide(color: selectedTab['status'] == filterStatus['status'] ? primaryColor : Colors.transparent),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            label: Text(
                              filterStatus['name'],
                              style: boldTextStyle(
                                size: 12,
                                color: selectedTab['status'] == filterStatus['status']
                                    ? primaryColor
                                   :Colors.white
                              ),
                            ),
                            selected: false,
                            backgroundColor: selectedTab['status'] == filterStatus['status'] ? lightPrimaryColor : context.cardColor,
                            onSelected: (bool selected) {
                              selectedTab = helpDeskStatus[index];
                              filterHelpDeskList(status: selectedTab['status']);
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ).paddingOnly(right: 16),
              Expanded(
                child: AnimatedListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  listAnimationType: ListAnimationType.FadeIn,
                  fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
                  itemCount: filteredList.length,
                  emptyWidget: appStore.isLoading
                      ? Offstage()
                      : NoDataWidget(
                    title: "",
                    titleTextStyle: boldTextStyle(),
                    subTitle: selectedTab['status'] == "open"
                        ? "language.toSubmitYourProblems"
                        : "",
                    imageWidget: selectedTab['status'] == "open" ? Icon(Icons.ice_skating) : EmptyStateWidget(),
                    retryText: selectedTab['status'] == "open" ? "language.add" : null,
                    onRetry: selectedTab['status'] == "open"
                        ? () {
                      AddHelpDeskScreen(callback: (newItem) {
                        helpDeskList.insert(0, HelpDeskListData(
                          // id: helpDeskList.length + 1,
                          // title: newItem.title ?? "New Issue",
                          // description: newItem.description ?? "New description",
                          // status: "open",
                          // createdAt: DateTime.now().toDateString(),
                          // updatedAt: DateTime.now().toDateString(),

                          id: helpDeskList.length + 1,
                          subject: "Payment Issue",
                          description: "I'm having trouble processing my payment for the recent booking.",
                          createdAt: DateTime.now().toString(),
                          status: "OPEN", // Assuming OPEN is a constant defined in your code
                          // createdAt: DateTime.now().toDateString(),
                          updatedAt: DateTime.now().toString(),
                          // createdAt: DateTime.now().toString(),
                        ));

                        filterHelpDeskList(status: selectedTab['status']);
                        setState(() {});
                      }).launch(context);
                    }
                        : null,
                  ).paddingSymmetric(horizontal: 16),
                  shrinkWrap: true,
                  onSwipeRefresh: () async {
                    filterHelpDeskList(status: selectedTab['status']);
                    return await 2.seconds.delay;
                  },
                  disposeScrollController: true,
                  itemBuilder: (BuildContext context, index) {
                    return HelpDeskItemComponent(helpDeskData: filteredList[index]);
                  },
                ),
              ),
            ],
          ),
          Observer(builder: (_) => LoaderWidget().visible(appStore.isLoading)),
        ],
      ),
    );
  }
}