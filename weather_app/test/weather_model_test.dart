import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather Model Test', () {
    test('should return a valid Weather model from a realistic Manila JSON sample', () {
      // 1. Realistic Manila sample from OpenWeatherMap (standard 2.5 response)
      const manilaWeatherJson = '''
      {
        "coord": { "lon": 120.9822, "lat": 14.5995 },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 28.5,
          "feels_like": 31.2,
          "temp_min": 27.0,
          "temp_max": 30.0,
          "pressure": 1010,
          "humidity": 74
        },
        "visibility": 10000,
        "wind": { "speed": 3.6, "deg": 80 },
        "clouds": { "all": 75 },
        "dt": 1705051200,
        "sys": {
          "type": 1,
          "id": 7905,
          "country": "PH",
          "sunrise": 1705011900,
          "sunset": 1705052400
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // 2. Parse the JSON
      final Map<String, dynamic> jsonMap = jsonDecode(manilaWeatherJson);

      // 3. Act: Create the model instance
      final weather = Weather.fromJson(jsonMap);

      // 4. Assert: Verify the data matches your expectations
      // Note: Adjust the property names (cityName, temperature, etc.)
      // based on your actual Weather model definition.
      expect(weather.city, 'Manila');
      expect(weather.temperature, 28.5);
      expect(weather.description, 'Clouds');

      // If your model handles nested descriptions:
      // expect(weather.description, 'broken clouds');
    });

    test('should throw an error or handle missing fields if necessary', () {
      // Test for empty/invalid JSON to ensure your model is robust
      final Map<String, dynamic> invalidJson = {};

      expect(
            () => Weather.fromJson(invalidJson),
        throwsA(isA<TypeError>()), // Or however your model handles missing keys
      );
    });
  });
}
