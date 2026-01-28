import 'length_converter.dart';
import 'weight_converter.dart';
import 'temperature_converter.dart';

import 'length_unit.dart';
import 'weight_unit.dart';
import 'temperature_unit.dart';

class UnitConverterService {
  static double convertLength(
      double value, LengthUnit from, LengthUnit to) {
    return LengthConverter.convert(
      value: value,
      from: from,
      to: to,
    );
  }

  static double convertWeight(
      double value, WeightUnit from, WeightUnit to) {
    return WeightConverter.convert(
      value: value,
      from: from,
      to: to,
    );
  }

  static double convertTemperature(
      double value, TemperatureUnit from, TemperatureUnit to) {
    return TemperatureConverter.convert(
      value: value,
      from: from,
      to: to,
    );
  }
}
