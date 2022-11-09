// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coordinate_to_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoordinateToAddressModel _$CoordinateToAddressModelFromJson(
    Map<String, dynamic> json) {
  return _CoordinateToAddressModel.fromJson(json);
}

/// @nodoc
mixin _$CoordinateToAddressModel {
  String get zipcode => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinateToAddressModelCopyWith<CoordinateToAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateToAddressModelCopyWith<$Res> {
  factory $CoordinateToAddressModelCopyWith(CoordinateToAddressModel value,
          $Res Function(CoordinateToAddressModel) then) =
      _$CoordinateToAddressModelCopyWithImpl<$Res, CoordinateToAddressModel>;
  @useResult
  $Res call({String zipcode, String type, String text});
}

/// @nodoc
class _$CoordinateToAddressModelCopyWithImpl<$Res,
        $Val extends CoordinateToAddressModel>
    implements $CoordinateToAddressModelCopyWith<$Res> {
  _$CoordinateToAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipcode = null,
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoordinateToAddressModelCopyWith<$Res>
    implements $CoordinateToAddressModelCopyWith<$Res> {
  factory _$$_CoordinateToAddressModelCopyWith(
          _$_CoordinateToAddressModel value,
          $Res Function(_$_CoordinateToAddressModel) then) =
      __$$_CoordinateToAddressModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String zipcode, String type, String text});
}

/// @nodoc
class __$$_CoordinateToAddressModelCopyWithImpl<$Res>
    extends _$CoordinateToAddressModelCopyWithImpl<$Res,
        _$_CoordinateToAddressModel>
    implements _$$_CoordinateToAddressModelCopyWith<$Res> {
  __$$_CoordinateToAddressModelCopyWithImpl(_$_CoordinateToAddressModel _value,
      $Res Function(_$_CoordinateToAddressModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipcode = null,
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$_CoordinateToAddressModel(
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoordinateToAddressModel implements _CoordinateToAddressModel {
  const _$_CoordinateToAddressModel(
      {required this.zipcode, required this.type, required this.text});

  factory _$_CoordinateToAddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoordinateToAddressModelFromJson(json);

  @override
  final String zipcode;
  @override
  final String type;
  @override
  final String text;

  @override
  String toString() {
    return 'CoordinateToAddressModel(zipcode: $zipcode, type: $type, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoordinateToAddressModel &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, zipcode, type, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoordinateToAddressModelCopyWith<_$_CoordinateToAddressModel>
      get copyWith => __$$_CoordinateToAddressModelCopyWithImpl<
          _$_CoordinateToAddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoordinateToAddressModelToJson(
      this,
    );
  }
}

abstract class _CoordinateToAddressModel implements CoordinateToAddressModel {
  const factory _CoordinateToAddressModel(
      {required final String zipcode,
      required final String type,
      required final String text}) = _$_CoordinateToAddressModel;

  factory _CoordinateToAddressModel.fromJson(Map<String, dynamic> json) =
      _$_CoordinateToAddressModel.fromJson;

  @override
  String get zipcode;
  @override
  String get type;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_CoordinateToAddressModelCopyWith<_$_CoordinateToAddressModel>
      get copyWith => throw _privateConstructorUsedError;
}
