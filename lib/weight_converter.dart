import 'weight_unit.dart';

class WeightConverter {
  static double convert({
    required double value,
    required WeightUnit from,
    required WeightUnit to,
  }) {
    double valueInKg;

    switch (from) {
      case WeightUnit.kilogram:
        valueInKg = value;
        break;
      case WeightUnit.gram:
        valueInKg = value / 1000;
        break;
      case WeightUnit.ton:
        valueInKg = value * 1000;
        break;
    }

    switch (to) {
      case WeightUnit.kilogram:
        return valueInKg;
      case WeightUnit.gram:
        return valueInKg * 1000;
      case WeightUnit.ton:
        return valueInKg / 1000;
    }
  }
}
