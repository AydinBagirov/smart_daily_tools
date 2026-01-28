enum CurrencyUnit {
  USD,
  EUR,
  TRY,
  GBP,
  JPY,
}

extension CurrencyUnitExtension on CurrencyUnit {
  String get name {
    switch (this) {
      case CurrencyUnit.USD:
        return 'USD';
      case CurrencyUnit.EUR:
        return 'EUR';
      case CurrencyUnit.TRY:
        return 'TRY';
      case CurrencyUnit.GBP:
        return 'GBP';
      case CurrencyUnit.JPY:
        return 'JPY';
      default:
        return '';
    }
  }
}
