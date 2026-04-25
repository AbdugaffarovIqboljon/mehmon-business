import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_entity.freezed.dart';

class GuestVisitEntity {
  const GuestVisitEntity({
    required this.date,
    required this.tableLabel,
    required this.guestCount,
  });

  final String date;
  final String tableLabel;
  final int guestCount;
}

@freezed
abstract class GuestEntity with _$GuestEntity {
  const factory GuestEntity({
    required String id,
    required String name,
    required String phone,
    required int visitCount,
    required bool isVIP,
    required String lastVisit,
    String? email,
    String? notes,
  }) = _GuestEntity;
}
