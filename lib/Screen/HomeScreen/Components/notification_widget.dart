import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class NotificationWidget extends StatelessWidget {
  final String profileImage;
  final String type;
  final String message;
  final String createdAt;
  final bool isRead;

  NotificationWidget({
    this.profileImage = '',
    this.type = 'booking_request',
    this.message = 'Your booking request has been confirmed!',
    this.createdAt = '2025-03-21 12:00 PM',
    this.isRead = false,
  });

  Color _getBGColor(BuildContext context) {
    return isRead ? context.scaffoldBackgroundColor : context.cardColor;
  }

  String parseHtmlString(String htmlString) {
    return htmlString.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }

  Widget customImageBorder({required String src, double height = 40}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        src,
        height: height,
        width: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.person, size: height),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: boxDecorationDefault(
        color: _getBGColor(context),
        borderRadius: radius(0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileImage.isNotEmpty
              ? customImageBorder(src: profileImage, height: 40)
              : customImageBorder(src: 'https://via.placeholder.com/40', height: 40), // Default Image
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type.split('_').join(' ').capitalizeFirstLetter(),
                      style: boldTextStyle(size: 12))
                      .expand(),
                  Text(createdAt, style: secondaryTextStyle()),
                ],
              ),
              4.height,
              Text(parseHtmlString(message),
                  style: secondaryTextStyle(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
