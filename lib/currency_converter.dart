import 'currency_unit.dart';

class CurrencyConverter {
  static Map<CurrencyUnit, double> rates = {
    CurrencyUnit.USD: 1.0,
    CurrencyUnit.EUR: 0.92,
    CurrencyUnit.TRY: 27.0,
    CurrencyUnit.GBP: 0.8,
    CurrencyUnit.JPY: 150.0,
  };

  static double convert({
    required double value,
    required CurrencyUnit from,
    required CurrencyUnit to,
  }) {
    double usdValue = value / rates[from]!; // önce USD’ye çevir
    return usdValue * rates[to]!; // sonra hedef birime çevir
  }
}
