import 'length_unit.dart';

class LengthConverter {
  static double convert({
    required double value,
    required LengthUnit from,
    required LengthUnit to,
  }) {
    double valueInMeters;

    switch (from) {
      case LengthUnit.meter:
        valueInMeters = value;
        break;
      case LengthUnit.kilometer:
        valueInMeters = value * 1000;
        break;
      case LengthUnit.centimeter:
        valueInMeters = value / 100;
        break;
    }

    switch (to) {
      case LengthUnit.meter:
        return valueInMeters;
      case LengthUnit.kilometer:
        return valueInMeters / 1000;
      case LengthUnit.centimeter:
        return valueInMeters * 100;
    }
  }
}
