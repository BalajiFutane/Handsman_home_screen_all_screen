


import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

// import '../../../utils/constant.dart';



class HelpDeskItemComponent extends StatefulWidget {
  final HelpDeskListData helpDeskData;

  HelpDeskItemComponent({required this.helpDeskData});

  @override
  _HelpDeskItemComponentState createState() => _HelpDeskItemComponentState();
}

class _HelpDeskItemComponentState extends State<HelpDeskItemComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // HelpDeskDetailScreen(helpDeskData: widget.helpDeskData).launch(context);
      },
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(bottom: 16),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(),
          backgroundColor: context.cardColor,
          // border: appStore.isDarkMode ? Border.all(color: context.dividerColor) : null,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('#${widget.helpDeskData.id}', style: boldTextStyle(color: primaryColor)),
                8.height,
                Text(
                  // formatBookingDate(widget.helpDeskData.createdAt.validate(), format: "dd/MM/yyyy, hh:mm a"),

                 "hello",
                  style: secondaryTextStyle(),
                ),
                16.height,
                Text(
                  widget.helpDeskData.subject.validate(),
                  style: boldTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.height,
                Text(
                  widget.helpDeskData.description.validate(),
                  style: secondaryTextStyle(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.helpDeskData.status == "CLOSED")
                  Column(
                    children: [
                      16.height,
                      Divider(height: 0, color: context.dividerColor),
                      16.height,
                      Row(
                        children: [
                          Text(
                            "closedOn",
                            style: boldTextStyle(size: 12, color: Colors.green),
                          ).expand(),
                          Text(
                            // formatBookingDate(widget.helpDeskData.updatedAt.validate(), format: "dd/MM/yyyy, hh:mm a"),
                           "time",
                            style: secondaryTextStyle(),
                          ),
                        ],
                      ),
                      16.height,
                    ],
                  ),
                if (widget.helpDeskData.status != "CLOSED") 16.height,
                TextButton(
                  onPressed: () async {
                    // HelpDeskDetailScreen(helpDeskData: widget.helpDeskData).launch(context);
                  },
                  style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 2, horizontal: 0))),
                  child: Text(
                    "viewDetail",
                    style: boldTextStyle(color: primaryColor, size: 12),
                  ),
                ).withHeight(25),
              ],
            ).paddingAll(16),


            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 8, bottomLeft: 8),
                  backgroundColor: widget.helpDeskData.status.validate() == "open"
                      ? Colors.green
                      : Colors.red,
                ),
                child: Text(
                  widget.helpDeskData.status.validate(), // Displaying status directly
                  style: boldTextStyle(color: Colors.white, size: 12),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



class HelpDeskListData {
  int? id;
  String? subject;
  int? employeeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? employeeName;
  String? status;
  List<String>? helDeskAttachments;
  List<Attachments>? attachments;

  HelpDeskListData({
    this.id,
    this.subject,
    this.employeeId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.employeeName,
    this.status,
    this.helDeskAttachments,
    this.attachments,
  });

  HelpDeskListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    employeeId = json['employee_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    employeeName = json['employee_name'];
    status = json['status'];
    helDeskAttachments = json['attachments'] != null ? new List<String>.from(json['attachments']) : null;
    attachments = json['attachments_array'] != null ? (json['attachments_array'] as List).map((i) => Attachments.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['employee_id'] = this.employeeId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['employee_name'] = this.employeeName;
    data['status'] = this.status;
    if (this.helDeskAttachments != null) {
      data['attachments'] = this.helDeskAttachments;
    }
    if (this.attachments != null) {
      data['attachments_array'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Attachments {
  int? id;
  String? url;

  Attachments({this.id, this.url});

  factory Attachments.fromJson(Map<String, dynamic> json) {
    return Attachments(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
