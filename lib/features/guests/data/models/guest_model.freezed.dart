// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GuestVisitModel _$GuestVisitModelFromJson(Map<String, dynamic> json) {
  return _GuestVisitModel.fromJson(json);
}

/// @nodoc
mixin _$GuestVisitModel {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_label')
  String get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count')
  int get guestCount => throw _privateConstructorUsedError;

  /// Serializes this GuestVisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestVisitModelCopyWith<GuestVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestVisitModelCopyWith<$Res> {
  factory $GuestVisitModelCopyWith(
    GuestVisitModel value,
    $Res Function(GuestVisitModel) then,
  ) = _$GuestVisitModelCopyWithImpl<$Res, GuestVisitModel>;
  @useResult
  $Res call({
    String date,
    @JsonKey(name: 'table_label') String tableLabel,
    @JsonKey(name: 'guest_count') int guestCount,
  });
}

/// @nodoc
class _$GuestVisitModelCopyWithImpl<$Res, $Val extends GuestVisitModel>
    implements $GuestVisitModelCopyWith<$Res> {
  _$GuestVisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tableLabel = null,
    Object? guestCount = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            tableLabel: null == tableLabel
                ? _value.tableLabel
                : tableLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestVisitModelImplCopyWith<$Res>
    implements $GuestVisitModelCopyWith<$Res> {
  factory _$$GuestVisitModelImplCopyWith(
    _$GuestVisitModelImpl value,
    $Res Function(_$GuestVisitModelImpl) then,
  ) = __$$GuestVisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String date,
    @JsonKey(name: 'table_label') String tableLabel,
    @JsonKey(name: 'guest_count') int guestCount,
  });
}

/// @nodoc
class __$$GuestVisitModelImplCopyWithImpl<$Res>
    extends _$GuestVisitModelCopyWithImpl<$Res, _$GuestVisitModelImpl>
    implements _$$GuestVisitModelImplCopyWith<$Res> {
  __$$GuestVisitModelImplCopyWithImpl(
    _$GuestVisitModelImpl _value,
    $Res Function(_$GuestVisitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tableLabel = null,
    Object? guestCount = null,
  }) {
    return _then(
      _$GuestVisitModelImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        tableLabel: null == tableLabel
            ? _value.tableLabel
            : tableLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestVisitModelImpl implements _GuestVisitModel {
  const _$GuestVisitModelImpl({
    required this.date,
    @JsonKey(name: 'table_label') required this.tableLabel,
    @JsonKey(name: 'guest_count') this.guestCount = 1,
  });

  factory _$GuestVisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestVisitModelImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'table_label')
  final String tableLabel;
  @override
  @JsonKey(name: 'guest_count')
  final int guestCount;

  @override
  String toString() {
    return 'GuestVisitModel(date: $date, tableLabel: $tableLabel, guestCount: $guestCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestVisitModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, tableLabel, guestCount);

  /// Create a copy of GuestVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestVisitModelImplCopyWith<_$GuestVisitModelImpl> get copyWith =>
      __$$GuestVisitModelImplCopyWithImpl<_$GuestVisitModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestVisitModelImplToJson(this);
  }
}

abstract class _GuestVisitModel implements GuestVisitModel {
  const factory _GuestVisitModel({
    required final String date,
    @JsonKey(name: 'table_label') required final String tableLabel,
    @JsonKey(name: 'guest_count') final int guestCount,
  }) = _$GuestVisitModelImpl;

  factory _GuestVisitModel.fromJson(Map<String, dynamic> json) =
      _$GuestVisitModelImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'table_label')
  String get tableLabel;
  @override
  @JsonKey(name: 'guest_count')
  int get guestCount;

  /// Create a copy of GuestVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestVisitModelImplCopyWith<_$GuestVisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestModel _$GuestModelFromJson(Map<String, dynamic> json) {
  return _GuestModel.fromJson(json);
}

/// @nodoc
mixin _$GuestModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_label')
  String? get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  String? get visitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count')
  int get guestCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_count')
  int get visitCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_vip')
  bool get isVip => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_in_hall')
  bool get isInHall => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_history')
  List<GuestVisitModel> get visitHistory => throw _privateConstructorUsedError;

  /// Serializes this GuestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestModelCopyWith<GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestModelCopyWith<$Res> {
  factory $GuestModelCopyWith(
    GuestModel value,
    $Res Function(GuestModel) then,
  ) = _$GuestModelCopyWithImpl<$Res, GuestModel>;
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    String? email,
    @JsonKey(name: 'table_label') String? tableLabel,
    @JsonKey(name: 'visit_date') String? visitDate,
    @JsonKey(name: 'guest_count') int guestCount,
    @JsonKey(name: 'visit_count') int visitCount,
    String? notes,
    @JsonKey(name: 'is_vip') bool isVip,
    @JsonKey(name: 'is_in_hall') bool isInHall,
    @JsonKey(name: 'visit_history') List<GuestVisitModel> visitHistory,
  });
}

/// @nodoc
class _$GuestModelCopyWithImpl<$Res, $Val extends GuestModel>
    implements $GuestModelCopyWith<$Res> {
  _$GuestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? tableLabel = freezed,
    Object? visitDate = freezed,
    Object? guestCount = null,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
    Object? isInHall = null,
    Object? visitHistory = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            tableLabel: freezed == tableLabel
                ? _value.tableLabel
                : tableLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitDate: freezed == visitDate
                ? _value.visitDate
                : visitDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
            visitCount: null == visitCount
                ? _value.visitCount
                : visitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVip: null == isVip
                ? _value.isVip
                : isVip // ignore: cast_nullable_to_non_nullable
                      as bool,
            isInHall: null == isInHall
                ? _value.isInHall
                : isInHall // ignore: cast_nullable_to_non_nullable
                      as bool,
            visitHistory: null == visitHistory
                ? _value.visitHistory
                : visitHistory // ignore: cast_nullable_to_non_nullable
                      as List<GuestVisitModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuestModelImplCopyWith<$Res>
    implements $GuestModelCopyWith<$Res> {
  factory _$$GuestModelImplCopyWith(
    _$GuestModelImpl value,
    $Res Function(_$GuestModelImpl) then,
  ) = __$$GuestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    String? email,
    @JsonKey(name: 'table_label') String? tableLabel,
    @JsonKey(name: 'visit_date') String? visitDate,
    @JsonKey(name: 'guest_count') int guestCount,
    @JsonKey(name: 'visit_count') int visitCount,
    String? notes,
    @JsonKey(name: 'is_vip') bool isVip,
    @JsonKey(name: 'is_in_hall') bool isInHall,
    @JsonKey(name: 'visit_history') List<GuestVisitModel> visitHistory,
  });
}

/// @nodoc
class __$$GuestModelImplCopyWithImpl<$Res>
    extends _$GuestModelCopyWithImpl<$Res, _$GuestModelImpl>
    implements _$$GuestModelImplCopyWith<$Res> {
  __$$GuestModelImplCopyWithImpl(
    _$GuestModelImpl _value,
    $Res Function(_$GuestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? tableLabel = freezed,
    Object? visitDate = freezed,
    Object? guestCount = null,
    Object? visitCount = null,
    Object? notes = freezed,
    Object? isVip = null,
    Object? isInHall = null,
    Object? visitHistory = null,
  }) {
    return _then(
      _$GuestModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableLabel: freezed == tableLabel
            ? _value.tableLabel
            : tableLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitDate: freezed == visitDate
            ? _value.visitDate
            : visitDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
        visitCount: null == visitCount
            ? _value.visitCount
            : visitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVip: null == isVip
            ? _value.isVip
            : isVip // ignore: cast_nullable_to_non_nullable
                  as bool,
        isInHall: null == isInHall
            ? _value.isInHall
            : isInHall // ignore: cast_nullable_to_non_nullable
                  as bool,
        visitHistory: null == visitHistory
            ? _value._visitHistory
            : visitHistory // ignore: cast_nullable_to_non_nullable
                  as List<GuestVisitModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestModelImpl implements _GuestModel {
  const _$GuestModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.phone,
    this.email,
    @JsonKey(name: 'table_label') this.tableLabel,
    @JsonKey(name: 'visit_date') this.visitDate,
    @JsonKey(name: 'guest_count') this.guestCount = 1,
    @JsonKey(name: 'visit_count') this.visitCount = 0,
    this.notes,
    @JsonKey(name: 'is_vip') this.isVip = false,
    @JsonKey(name: 'is_in_hall') this.isInHall = false,
    @JsonKey(name: 'visit_history')
    final List<GuestVisitModel> visitHistory = const <GuestVisitModel>[],
  }) : _visitHistory = visitHistory;

  factory _$GuestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'table_label')
  final String? tableLabel;
  @override
  @JsonKey(name: 'visit_date')
  final String? visitDate;
  @override
  @JsonKey(name: 'guest_count')
  final int guestCount;
  @override
  @JsonKey(name: 'visit_count')
  final int visitCount;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'is_vip')
  final bool isVip;
  @override
  @JsonKey(name: 'is_in_hall')
  final bool isInHall;
  final List<GuestVisitModel> _visitHistory;
  @override
  @JsonKey(name: 'visit_history')
  List<GuestVisitModel> get visitHistory {
    if (_visitHistory is EqualUnmodifiableListView) return _visitHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitHistory);
  }

  @override
  String toString() {
    return 'GuestModel(id: $id, name: $name, avatarUrl: $avatarUrl, phone: $phone, email: $email, tableLabel: $tableLabel, visitDate: $visitDate, guestCount: $guestCount, visitCount: $visitCount, notes: $notes, isVip: $isVip, isInHall: $isInHall, visitHistory: $visitHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.isInHall, isInHall) ||
                other.isInHall == isInHall) &&
            const DeepCollectionEquality().equals(
              other._visitHistory,
              _visitHistory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    avatarUrl,
    phone,
    email,
    tableLabel,
    visitDate,
    guestCount,
    visitCount,
    notes,
    isVip,
    isInHall,
    const DeepCollectionEquality().hash(_visitHistory),
  );

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestModelImplCopyWith<_$GuestModelImpl> get copyWith =>
      __$$GuestModelImplCopyWithImpl<_$GuestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestModelImplToJson(this);
  }
}

abstract class _GuestModel implements GuestModel {
  const factory _GuestModel({
    required final String id,
    required final String name,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? phone,
    final String? email,
    @JsonKey(name: 'table_label') final String? tableLabel,
    @JsonKey(name: 'visit_date') final String? visitDate,
    @JsonKey(name: 'guest_count') final int guestCount,
    @JsonKey(name: 'visit_count') final int visitCount,
    final String? notes,
    @JsonKey(name: 'is_vip') final bool isVip,
    @JsonKey(name: 'is_in_hall') final bool isInHall,
    @JsonKey(name: 'visit_history') final List<GuestVisitModel> visitHistory,
  }) = _$GuestModelImpl;

  factory _GuestModel.fromJson(Map<String, dynamic> json) =
      _$GuestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'table_label')
  String? get tableLabel;
  @override
  @JsonKey(name: 'visit_date')
  String? get visitDate;
  @override
  @JsonKey(name: 'guest_count')
  int get guestCount;
  @override
  @JsonKey(name: 'visit_count')
  int get visitCount;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'is_vip')
  bool get isVip;
  @override
  @JsonKey(name: 'is_in_hall')
  bool get isInHall;
  @override
  @JsonKey(name: 'visit_history')
  List<GuestVisitModel> get visitHistory;

  /// Create a copy of GuestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestModelImplCopyWith<_$GuestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
