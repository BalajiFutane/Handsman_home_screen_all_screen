


import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/Comp/cached_image_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/dotted_line.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/image_border_component.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/price_widget.dart';
import 'package:nb_utils/nb_utils.dart';

// Mock data classes that match your original models
class BookingDataa {
  final String id;
  final String status;
  final String serviceId;
  final bool isSlotBooking;
  final String date;
  final String? bookingSlot;
  final bool isPackageBooking;
  final BookingPackage? bookingPackage;
  final List<String> serviceAttachments;
  final String serviceName;
  final String totalAmount;
  final String type;
  final bool isHourlyService;
  final String amount;
  final int? discount;
  final String? paymentStatus;
  final String? paymentMethod;
  final bool isPostJob;
  final String address;
  final String providerImage;
  final String providerName;
  final int providerIsVerified;
  final bool isProviderAndHandymanSame;
  final List<Handyman> handyman;

  const BookingDataa({
    required this.id,
    required this.status,
    required this.serviceId,
    required this.isSlotBooking,
    required this.date,
    this.bookingSlot,
    this.isPackageBooking = false,
    this.bookingPackage,
    required this.serviceAttachments,
    required this.serviceName,
    required this.totalAmount,
    required this.type,
    required this.isHourlyService,
    required this.amount,
    this.discount,
    this.paymentStatus,
    this.paymentMethod,
    this.isPostJob = false,
    required this.address,
    required this.providerImage,
    required this.providerName,
    required this.providerIsVerified,
    required this.isProviderAndHandymanSame,
    required this.handyman,
  });
}

class BookingPackage {
  final String name;
  final List<String> imageAttachments;
  final String totalAmount;

  const BookingPackage({
    required this.name,
    required this.imageAttachments,
    required this.totalAmount,
  });
}

class Handyman {
  final HandymanDetails? handyman;

  const Handyman({this.handyman});
}

class HandymanDetails {
  final String handymanImage;
  final String displayName;
  final int isVerifyHandyman;

  const HandymanDetails({
    required this.handymanImage,
    required this.displayName,
    required this.isVerifyHandyman,
  });
}

// Mock constants that match your original
class BookingStatusKeys {
  static const pending = 'pending';
  static const complete = 'complete';
  static const cancelled = 'cancelled';
}

class SERVICE_TYPE {
  static const FREE = 'free';
}

class SERVICE_PAYMENT_STATUS {
  static const ADVANCE_PAID = 'advance_paid';
  static const PAID = 'paid';
  static const PENDING_BY_ADMIN = 'pending_by_admin';
}

// Mock language strings
class Language {
  String get lblUpdateDateAndTime => 'Update Date & Time';
  String get postJob => 'Post Job';
  String get package => 'Package';
  String get hintAddress => 'Address';
  String get lblDate => 'Date';
  String get lblTime => 'Time';
  String get at => 'at';
  String get paymentStatus => 'Payment Status';
  String get lblOff => 'off';
  String get textProvider => 'Provider';
  String get textHandyman => 'Handyman';
}



class BookingItemComponent extends StatefulWidget {
  final BookingDataa bookingData;
  final Language language = Language();

   BookingItemComponent({required this.bookingData});

  @override
  State<BookingItemComponent> createState() => _BookingItemComponentState();
}

class _BookingItemComponentState extends State<BookingItemComponent> {


  String buildTimeWidget({required BookingDataa bookingDetail}) {
    if (bookingDetail.bookingSlot == null) {
      return formatDate(bookingDetail.date, isTime: true);
    }
    return formatDate(bookingDetail.date + ' ' + bookingDetail.bookingSlot!, isTime: true);
  }

  String formatDate(String date, {bool isTime = false}) {
    // Simple formatter that matches your original output
    try {
      final parsed = DateTime.parse(date);
      if (isTime) {
        return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
      }
      return '${parsed.day}/${parsed.month}/${parsed.year}';
    } catch (e) {
      return date;
    }
  }

  String toBookingStatus(String status) {
    switch (status) {
      case BookingStatusKeys.pending:
        return 'Pending';
      case BookingStatusKeys.complete:
        return 'Completed';
      case BookingStatusKeys.cancelled:
        return 'Cancelled';
      default:
        return status;
    }
  }

  Color getPaymentStatusBackgroundColor(String status) {
    switch (status) {
      case BookingStatusKeys.pending:
        return Colors.orange;
      case BookingStatusKeys.complete:
        return Colors.green;
      case BookingStatusKeys.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String buildPaymentStatusWithMethod(String paymentStatus, String paymentMethod) {
    if (paymentStatus == SERVICE_PAYMENT_STATUS.PAID) {
      return 'Paid (${paymentMethod.toUpperCase()})';
    } else if (paymentStatus == SERVICE_PAYMENT_STATUS.ADVANCE_PAID) {
      return 'Advance Paid (${paymentMethod.toUpperCase()})';
    } else if (paymentStatus == SERVICE_PAYMENT_STATUS.PENDING_BY_ADMIN) {
      return 'Pending Approval';
    }
    return 'Pending Payment';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? Theme.of(context).cardColor : Color(0xFFF5F5F5);
    final whiteColor = isDarkMode ? Colors.grey[900]! : Colors.white;

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.bookingData.isPackageBooking)
                CachedImageWidget(
                  url: widget.bookingData.bookingPackage?.imageAttachments.isNotEmpty ?? false
                      ? widget.bookingData.bookingPackage!.imageAttachments.first
                      : '',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  radius: 8,
                )
              else
                CachedImageWidget(
                  url: widget.bookingData.serviceAttachments.isNotEmpty
                      ? widget.bookingData.serviceAttachments.first
                      : '',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                  radius: 8,
                ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Theme.of(context).primaryColor),
                                ),
                                child: Text(
                                  '#${widget.bookingData.id}',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: getPaymentStatusBackgroundColor(widget.bookingData.status),
                                  ),
                                ),
                                child: Marquee(
                                  child: Text(
                                    toBookingStatus(widget.bookingData.status),
                                    style: TextStyle(
                                      color: getPaymentStatusBackgroundColor(widget.bookingData.status),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              if (widget.bookingData.isPostJob)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Theme.of(context).primaryColor),
                                  ),
                                  child: Text(
                                    widget.language.postJob,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (widget.bookingData.isPackageBooking)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Theme.of(context).primaryColor),
                                  ),
                                  child: Text(
                                    widget.language.package,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Marquee(
                      child: Text(
                        widget.bookingData.isPackageBooking
                            ? widget.bookingData.bookingPackage?.name ?? ''
                            : widget.bookingData.serviceName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 8),
                    if (widget.bookingData.bookingPackage != null)
                      PriceWidget(
                        // price: widget.bookingData.totalAmount.toInt(),
                      price: 500,
                        color: Theme.of(context).primaryColor,
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Marquee(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PriceWidget(
                                    isFreeService: widget.bookingData.type == SERVICE_TYPE.FREE,
                                    // price: widget.bookingData.totalAmount.toInt(),
                                    price: 500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  if (widget.bookingData.isHourlyService)
                                    Row(
                                      children: [
                                        SizedBox(width: 4),
                                        PriceWidget(
                                          // price: widget.bookingData.amount.toInt(),
                                          price: 50,
                                          color: Colors.grey[600]!,
                                          isHourlyService: true,
                                          size: 12,
                                          isBoldText: false,
                                        ),
                                      ],
                                    ),
                                  if (widget.bookingData.discount != null && widget.bookingData.discount! != 0)
                                    Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text(
                                        '(${widget.bookingData.discount!}% ${widget.language.lblOff})',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // _buildEditBookingWidget(),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ).paddingAll(8),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.bookingData.address.isNotEmpty)


                  Row(
                    children: [
                      Text(
                        '${widget.language.hintAddress}:',
                        style: secondaryTextStyle(),
                      ).expand(flex: 2),
                      8.width,
                      Marquee(
                        child: Text(
                          widget.bookingData.address.validate(),
                          style: boldTextStyle(size: 12),
                          textAlign: TextAlign.left,
                        ),
                      ).expand(flex: 5),
                    ],
                  ).paddingAll(8),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.language.lblDate} & ${widget.language.lblTime}:',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ).expand(flex: 2),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: Marquee(
                        child: Text(
                          "${formatDate(widget.bookingData.date)} ${widget.language.at} ${buildTimeWidget(bookingDetail: widget.bookingData)}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 8, bottom: 8, right: 8),

                Column(
                  children: [
                    DottedLine(
                      dashGapLength: 5,
                      dashLength: 8,
                    ).paddingAll(8),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          ImageBorder(
                            src: widget.bookingData.handyman.isEmpty
                                ? widget.bookingData.providerImage
                                : widget.bookingData.isProviderAndHandymanSame
                                ? widget.bookingData.providerImage
                                : widget.bookingData.handyman.first.handyman?.handymanImage ?? '',
                            height: 40,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Marquee(
                                        child: Text(
                                          widget.bookingData.handyman.isEmpty
                                              ? widget.bookingData.providerName
                                              : widget.bookingData.isProviderAndHandymanSame
                                              ? widget.bookingData.providerName
                                              : widget.bookingData.handyman.first.handyman?.displayName ?? '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified,
                                      size: 14,
                                      color: Colors.green,
                                    ).visible(
                                      widget.bookingData.handyman.isEmpty
                                          ? widget.bookingData.providerIsVerified == 1
                                          : widget.bookingData.isProviderAndHandymanSame
                                          ? widget.bookingData.providerIsVerified == 1
                                          : widget.bookingData.handyman.first.handyman?.isVerifyHandyman == 1,
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.bookingData.handyman.isEmpty
                                      ? widget.language.textProvider
                                      : widget.language.textHandyman,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool get isDateTimeAfterNow {
    try {
      if (widget.bookingData.bookingSlot != null) {
        final bookingDateTimeForTimeSlots = widget.bookingData.date.split(" ").isNotEmpty
            ? widget.bookingData.date.split(" ").first
            : "";
        final bookingTimeForTimeSlots = widget.bookingData.bookingSlot!;
        return DateTime.parse(bookingDateTimeForTimeSlots + " " + bookingTimeForTimeSlots).isAfter(DateTime.now());
      } else {
        return DateTime.parse(widget.bookingData.date).isAfter(DateTime.now());
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }
}
