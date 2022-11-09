import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocation_practice/enum.dart';
import 'package:geolocation_practice/models/coordinate_to_address_model/coordinate_to_address_model.dart';
import 'package:geolocator/geolocator.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(LocationStatus.notExecute) LocationStatus locationStatus,
    Position? position,
    CoordinateToAddressModel? coordinateToAddressModel,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState();
  }
}
