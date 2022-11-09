import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation_practice/enum.dart';
import 'package:geolocation_practice/home/data_source/vworld_data_source.dart';
import 'package:geolocation_practice/home/home_cubit/home_state.dart';
import 'package:geolocator/geolocator.dart';

class HomeCubit extends Cubit<HomeState> {
  VWorldDataSource vWorldDataSource;

  HomeCubit({required this.vWorldDataSource}) : super(HomeState.initial());

  Future<void> getLocation({required LocationTimeType locationTimeType}) async {
    emit(state.copyWith(locationStatus: LocationStatus.searching));
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(state.copyWith(locationStatus: LocationStatus.unAuth));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(locationStatus: LocationStatus.unAuth));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(locationStatus: LocationStatus.unAuth));
        return;
      }

      Position? newPosition;
      if (locationTimeType == LocationTimeType.current) {
        newPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      } else if (locationTimeType == LocationTimeType.last) {
        newPosition = await Geolocator.getLastKnownPosition();
      }
      if (newPosition == null) {
        emit(state.copyWith(locationStatus: LocationStatus.error));
      } else {
        emit(state.copyWith(locationStatus: LocationStatus.complete, position: newPosition));
      }
    } catch (e) {
      emit(state.copyWith(locationStatus: LocationStatus.error));
    }
  }

  Future<void> changePositionToAddress() async {
    if (state.position == null) {
      Fluttertoast.showToast(msg: "위치를 먼저 획득해주세요");
      return;
    }
    emit(state.copyWith(locationStatus: LocationStatus.searching));
    final result = await vWorldDataSource.getAddress(state.position!);

    result.when(success: (model) {
      emit(
        state.copyWith(
          locationStatus: LocationStatus.complete,
          coordinateToAddressModel: model,
        ),
      );
    }, error: (message) {
      emit(state.copyWith(locationStatus: LocationStatus.complete));
    });
  }
}
