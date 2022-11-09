import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate_to_address_model.freezed.dart';

part 'coordinate_to_address_model.g.dart';

@freezed
class CoordinateToAddressModel with _$CoordinateToAddressModel {
  const factory CoordinateToAddressModel({
    required String zipcode,
    required String type,
    required String text,
  }) = _CoordinateToAddressModel;

  factory CoordinateToAddressModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateToAddressModelFromJson(json);
}
