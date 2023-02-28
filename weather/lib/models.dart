class DailyForecast {
  final DateTime time;
  final WeatherCode weathercode;
  final double temperature_2m_max;
  final double temperature_2m_min;

  DailyForecast(
      {required this.time,
        required this.weathercode,
        required this.temperature_2m_max,
        required this.temperature_2m_min});

  String getWeekday() {
    switch (time.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}

class HourlyForecast {
  final DateTime time;
  final double temperature_2m;
  final double apparent_temperature;
  final double precipitation;
  final double precipitation_probability;

  HourlyForecast(
      {required this.time,
        required this.temperature_2m,
        required this.apparent_temperature,
        required this.precipitation,
        required this.precipitation_probability});
}


// 0 	Clear sky
// 1, 2, 3 	Mainly clear, partly cloudy, and overcast
// 45, 48 	Fog and depositing rime fog
// 51, 53, 55 	Drizzle: Light, moderate, and dense intensity
// 56, 57 	Freezing Drizzle: Light and dense intensity
// 61, 63, 65 	Rain: Slight, moderate and heavy intensity
// 66, 67 	Freezing Rain: Light and heavy intensity
// 71, 73, 75 	Snow fall: Slight, moderate, and heavy intensity
// 77 	Snow grains
// 80, 81, 82 	Rain showers: Slight, moderate, and violent
// 85, 86 	Snow showers slight and heavy
// 95 * 	Thunderstorm: Slight or moderate
// 96, 99 * 	Thunderstorm with slight and heavy hail
enum WeatherCode {
  ClearSky(0, 'Clear sky'),

  MainlyClear(1, 'Mainly clear'),
  PartlyCloudy(2, 'Partly cloudy'),
  Overcast(3, 'Overcast'),

  Fog(45, 'Fog'),
  DepositingRimeFog(48, 'Depositing rime fog'),

  DrizzleLight(51, 'Drizzle: Light intensity'),
  DrizzleModerate(53, 'Drizzle: Moderate intensity'),
  DrizzleDense(55, 'Drizzle: Dense intensity'),

  FreezingDrizzleLight(56, 'Freezing Drizzle: Light intensity'),
  FreezingDrizzleDense(57, 'Freezing Drizzle: dense intensity'),

  RainSlight(61, 'Rain: Slight intensity'),
  RainModerate(63, 'Rain: Moderate intensity'),
  RainHeavy(65, 'Rain: Heavy intensity'),

  FreezingRainLight(66, 'Freezing Rain: Light intensity'),
  FreezingRainHeavy(66, 'Freezing Rain: Heavy intensity'),

  SnowFallSlight(71, 'Snow fall: Slight intensity'),
  SnowFallModerate(73, 'Snow fall: Moderate intensity'),
  SnowFallHeavy(75, 'Snow fall: Heavy intensity'),

  SnowGrains(77, 'Snow grains'),

  RainShowersSlight(80, 'Rain showers: Slight'),
  RainShowersModerate(81, 'Rain showers: Moderate'),
  RainShowersVoilent(82, 'Rain showers: Violent'),

  SnowShowersSlight(85, 'Snow showers: Slight'),
  SnowShowersHeavy(86, 'Snow showers: Heavy'),

  Thunerstorm(95, 'Thunderstorm: Slight or moderate'),
  ThunderstormSlightHail(96, 'Thunderstorm with slight hail'),
  ThunderstormHeavyHail(99, 'Thunderstorm with heavy hail'),
  ;

  final int numeric;
  final String description;
  const WeatherCode(this.numeric, this.description);

  static final _map =
  Map.fromEntries(WeatherCode.values.map((e) => MapEntry(e.numeric, e)));
  factory WeatherCode.fromNumeric(int numeric) {
    return WeatherCode._map[numeric]!;
  }
}
