import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Dummy model class to replace TaxData
class TaxData {
  final String title;
  final double value;
  final String type;
  double totalCalculatedValue;

  TaxData({
    required this.title,
    required this.value,
    required this.type,
    this.totalCalculatedValue = 0.0,
  });
}

// Dummy price widget for demonstration
class PriceWidget extends StatelessWidget {
  final double price;

  const PriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text('\$${price.toStringAsFixed(2)}', style: boldTextStyle());
  }
}

class AppliedTaxListBottomSheet extends StatelessWidget {
  final List<TaxData> taxes;
  final num subTotal;

  const AppliedTaxListBottomSheet({super.key, required this.taxes, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Applied Taxes', style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
          8.height,
          AnimatedListView(
            itemCount: taxes.length,
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            listAnimationType: ListAnimationType.FadeIn,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              TaxData data = taxes[index];

              if (data.type == 'percent') {
                data.totalCalculatedValue = subTotal * data.value / 100;
              } else {
                data.totalCalculatedValue = data.value;
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    data.type == 'percent'
                        ? Row(
                      children: [
                        Text(data.title, style: primaryTextStyle()),
                        4.width,
                        Text("(${data.value}%)", style: primaryTextStyle(color: context.primaryColor)),
                      ],
                    ).expand()
                        : Text(data.title, style: primaryTextStyle()).expand(),
                    PriceWidget(price: data.totalCalculatedValue),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
