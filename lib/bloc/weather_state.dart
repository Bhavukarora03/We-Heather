part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherInitial {

  @override
  List<Object> get props => [];
}

class WeatherSuccess extends WeatherInitial {



  @override
  List<Object> get props => [];
}

class Weathererror extends WeatherInitial {
  final String errorMsg;
  Weathererror(this.errorMsg);


  @override
  List<Object> get props => [errorMsg];
}