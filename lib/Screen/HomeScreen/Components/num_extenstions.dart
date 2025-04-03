import 'package:nb_utils/nb_utils.dart';

/// Configuration values (replace `appConfigurationStore`)
const String currencySymbol = '\$'; // Change this as needed
const int priceDecimalPoint = 2;
const bool isCurrencyPositionLeft = true;
const bool isCurrencyPositionRight = false;

extension NumExtension on num {
  /// Formats the number into a price format with currency symbol.
  String toPriceFormat() {
    return "${isCurrencyPositionLeft ? currencySymbol : ''}"
        "${this.toStringAsFixed(priceDecimalPoint).formatNumberWithComma()}"
        "${isCurrencyPositionRight ? currencySymbol : ''}";
  }

  /// Calculates the discounted price based on the given discount percentage.
  num calculatePercentage(int discount) {
    return this - (this * discount / 100);
  }
}
