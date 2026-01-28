import 'temperature_unit.dart';

class TemperatureConverter {
  static double convert({
    required double value,
    required TemperatureUnit from,
    required TemperatureUnit to,
  }) {
    if (from == to) return value;

    double celsius;

    switch (from) {
      case TemperatureUnit.celsius:
        celsius = value;
        break;
      case TemperatureUnit.fahrenheit:
        celsius = (value - 32) * 5 / 9;
        break;
      case TemperatureUnit.kelvin:
        celsius = value - 273.15;
        break;
    }

    switch (to) {
      case TemperatureUnit.celsius:
        return celsius;
      case TemperatureUnit.fahrenheit:
        return (celsius * 9 / 5) + 32;
      case TemperatureUnit.kelvin:
        return celsius + 273.15;
    }
  }
}
