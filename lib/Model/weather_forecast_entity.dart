import 'package:clima/generated/json/base/json_field.dart';
import 'package:clima/generated/json/weather_forecast_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WeatherForecastEntity {
  String cod;
  int message;
  int cnt;
  List<WeatherForecastList> list;
  WeatherForecastCity city;

  WeatherForecastEntity();

  factory WeatherForecastEntity.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastList {
  int dt;
  WeatherForecastListMain main;
  List<WeatherForecastListWeather> weather;
  WeatherForecastListClouds clouds;
  WeatherForecastListWind wind;
  int visibility;
  double pop;
  WeatherForecastListSys sys;
  @JSONField(name: "dt_txt")
  String dtTxt;
  WeatherForecastListRain rain;

  WeatherForecastList();

  factory WeatherForecastList.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListMain {
  double temp;
  @JSONField(name: "feels_like")
  double feelsLike;
  @JSONField(name: "temp_min")
  double tempMin;
  @JSONField(name: "temp_max")
  double tempMax;
  int pressure;
  @JSONField(name: "sea_level")
  int seaLevel;
  @JSONField(name: "grnd_level")
  int grndLevel;
  int humidity;
  @JSONField(name: "temp_kf")
  double tempKf;

  WeatherForecastListMain();

  factory WeatherForecastListMain.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListMainFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListMainToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListWeather {
  int id;
  String main;
  String description;
  String icon;

  WeatherForecastListWeather();

  factory WeatherForecastListWeather.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListWeatherFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListClouds {
  int all;

  WeatherForecastListClouds();

  factory WeatherForecastListClouds.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListCloudsFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListCloudsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListWind {
  double speed;
  int deg;
  double gust;

  WeatherForecastListWind();

  factory WeatherForecastListWind.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListWindFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListWindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListSys {
  String pod;

  WeatherForecastListSys();

  factory WeatherForecastListSys.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListSysFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListSysToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastListRain {
  @JSONField(name: "3h")
  double x3h;

  WeatherForecastListRain();

  factory WeatherForecastListRain.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastListRainFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastListRainToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastCity {
  int id;
  String name;
  WeatherForecastCityCoord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  WeatherForecastCity();

  factory WeatherForecastCity.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastCityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastCityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherForecastCityCoord {
  int lat;
  int lon;

  WeatherForecastCityCoord();

  factory WeatherForecastCityCoord.fromJson(Map<String, dynamic> json) =>
      $WeatherForecastCityCoordFromJson(json);

  Map<String, dynamic> toJson() => $WeatherForecastCityCoordToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
