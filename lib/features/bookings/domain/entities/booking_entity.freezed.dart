// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get partySize => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get tableId => throw _privateConstructorUsedError;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingEntityCopyWith<BookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEntityCopyWith<$Res> {
  factory $BookingEntityCopyWith(
    BookingEntity value,
    $Res Function(BookingEntity) then,
  ) = _$BookingEntityCopyWithImpl<$Res, BookingEntity>;
  @useResult
  $Res call({
    String id,
    String guestName,
    DateTime dateTime,
    int partySize,
    String status,
    String? notes,
    String? tableId,
  });
}

/// @nodoc
class _$BookingEntityCopyWithImpl<$Res, $Val extends BookingEntity>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? dateTime = null,
    Object? partySize = null,
    Object? status = null,
    Object? notes = freezed,
    Object? tableId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            guestName: null == guestName
                ? _value.guestName
                : guestName // ignore: cast_nullable_to_non_nullable
                      as String,
            dateTime: null == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            partySize: null == partySize
                ? _value.partySize
                : partySize // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            tableId: freezed == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingEntityImplCopyWith<$Res>
    implements $BookingEntityCopyWith<$Res> {
  factory _$$BookingEntityImplCopyWith(
    _$BookingEntityImpl value,
    $Res Function(_$BookingEntityImpl) then,
  ) = __$$BookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String guestName,
    DateTime dateTime,
    int partySize,
    String status,
    String? notes,
    String? tableId,
  });
}

/// @nodoc
class __$$BookingEntityImplCopyWithImpl<$Res>
    extends _$BookingEntityCopyWithImpl<$Res, _$BookingEntityImpl>
    implements _$$BookingEntityImplCopyWith<$Res> {
  __$$BookingEntityImplCopyWithImpl(
    _$BookingEntityImpl _value,
    $Res Function(_$BookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? guestName = null,
    Object? dateTime = null,
    Object? partySize = null,
    Object? status = null,
    Object? notes = freezed,
    Object? tableId = freezed,
  }) {
    return _then(
      _$BookingEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        guestName: null == guestName
            ? _value.guestName
            : guestName // ignore: cast_nullable_to_non_nullable
                  as String,
        dateTime: null == dateTime
            ? _value.dateTime
            : dateTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        partySize: null == partySize
            ? _value.partySize
            : partySize // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BookingEntityImpl implements _BookingEntity {
  const _$BookingEntityImpl({
    required this.id,
    required this.guestName,
    required this.dateTime,
    this.partySize = 2,
    this.status = 'pending',
    this.notes,
    this.tableId,
  });

  @override
  final String id;
  @override
  final String guestName;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final int partySize;
  @override
  @JsonKey()
  final String status;
  @override
  final String? notes;
  @override
  final String? tableId;

  @override
  String toString() {
    return 'BookingEntity(id: $id, guestName: $guestName, dateTime: $dateTime, partySize: $partySize, status: $status, notes: $notes, tableId: $tableId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    guestName,
    dateTime,
    partySize,
    status,
    notes,
    tableId,
  );

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      __$$BookingEntityImplCopyWithImpl<_$BookingEntityImpl>(this, _$identity);
}

abstract class _BookingEntity implements BookingEntity {
  const factory _BookingEntity({
    required final String id,
    required final String guestName,
    required final DateTime dateTime,
    final int partySize,
    final String status,
    final String? notes,
    final String? tableId,
  }) = _$BookingEntityImpl;

  @override
  String get id;
  @override
  String get guestName;
  @override
  DateTime get dateTime;
  @override
  int get partySize;
  @override
  String get status;
  @override
  String? get notes;
  @override
  String? get tableId;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
