import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/applied_tax_list_bottom_sheet.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/booking_item_component.dart';
import 'package:homescreen_client_balaji/Screen/edit_profile_screen.dart';
import 'package:homescreen_client_balaji/Screen/raw.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';

// Import necessary models and components
// import 'package:your_project/booking_item_component.dart';
// import 'package:your_project/models/booking_data.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  // Sample list of bookings
  final List<BookingDataa> bookings = [
    BookingDataa(
      id: '12345',
      status: BookingStatusKeys.pending,
      serviceId: '1',
      isSlotBooking: true,
      date: '2023-12-31 14:30:00',
      bookingSlot: '14:30',
      isPackageBooking: false,
      serviceAttachments: ['https://example.com/image.jpg'],
      serviceName: 'Haircut and Styling',
      totalAmount: '45.00',
      type: 'paid',
      isHourlyService: true,
      amount: '30.00',
      discount: 10,
      paymentStatus: SERVICE_PAYMENT_STATUS.PENDING_BY_ADMIN,
      paymentMethod: 'credit_card',
      isPostJob: false,
      address: '123 Main St, Anytown, USA',
      providerImage: 'https://example.com/provider.jpg',
      providerName: 'John Doe',
      providerIsVerified: 1,
      isProviderAndHandymanSame: false,
      handyman: [
        Handyman(
          handyman: HandymanDetails(
            handymanImage: 'https://example.com/handyman.jpg',
            displayName: 'Mike Smith',
            isVerifyHandyman: 1,
          ),
        ),
      ],
    ),
    BookingDataa(
      id: '12345',
      status: BookingStatusKeys.complete,
      serviceId: '1',
      isSlotBooking: true,
      date: '2023-12-31 14:30:00',
      bookingSlot: '14:30',
      isPackageBooking: false,
      serviceAttachments: ['https://example.com/image.jpg'],
      serviceName: 'Haircut and Styling',
      totalAmount: '45.00',
      type: 'paid',
      isHourlyService: true,
      amount: '30.00',
      discount: 10,
      paymentStatus: SERVICE_PAYMENT_STATUS.PENDING_BY_ADMIN,
      paymentMethod: 'credit_card',
      isPostJob: false,
      address: '123 Main St, Anytown, USA',
      providerImage: 'https://example.com/provider.jpg',
      providerName: 'John Doe',
      providerIsVerified: 1,
      isProviderAndHandymanSame: false,
      handyman: [
        Handyman(
          handyman: HandymanDetails(
            handymanImage: 'https://example.com/handyman.jpg',
            displayName: 'Mike Smith',
            isVerifyHandyman: 1,
          ),
        ),
      ],
    ),


    BookingDataa(
      id: '12345',
      status: BookingStatusKeys.cancelled,
      serviceId: '1',
      isSlotBooking: true,
      date: '2023-12-31 14:30:00',
      bookingSlot: '14:30',
      isPackageBooking: false,
      serviceAttachments: ['https://example.com/image.jpg'],
      serviceName: 'Haircut and Styling',
      totalAmount: '45.00',
      type: 'paid',
      isHourlyService: true,
      amount: '30.00',
      discount: 10,
      paymentStatus: SERVICE_PAYMENT_STATUS.PENDING_BY_ADMIN,
      paymentMethod: 'credit_card',
      isPostJob: false,
      address: '123 Main St, Anytown, USA',
      providerImage: 'https://example.com/provider.jpg',
      providerName: 'John Doe',
      providerIsVerified: 1,
      isProviderAndHandymanSame: false,
      handyman: [
        Handyman(
          handyman: HandymanDetails(
            handymanImage: 'https://example.com/handyman.jpg',
            displayName: 'Mike Smith',
            isVerifyHandyman: 1,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Bookings')),

      appnavcolor: primaryColor,
      appBarTitle: "Booking List",
      child: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            return BookingItemComponent(bookingData: bookings[index]);
          },
        ),

      )
    );
  }
}




class ExampleUsage extends StatefulWidget {
  const ExampleUsage({super.key});

  @override
  State<ExampleUsage> createState() => _ExampleUsageState();
}

List<TaxData> dummyTaxes = [
      TaxData(title: 'Sales Tax', value: 7.5, type: 'percent'),
      TaxData(title: 'Service Fee', value: 2.0, type: 'fixed'),
      TaxData(title: 'City Tax', value: 1.5, type: 'percent'),
    ];
class _ExampleUsageState extends State<ExampleUsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tax Example')),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Taxes ( this page code is in the page of nbooking list screen)'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              // builder: (_) => AppliedTaxListBottomSheet(
              //   taxes: dummyTaxes,
              //   subTotal: 100.0, // Example subtotal
              // ),
              builder: (_)=>AppliedTaxListBottomSheet(taxes: dummyTaxes, subTotal: 100),
            );
          },
        ),
      ),
    );
  }
}
