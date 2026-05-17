import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/floor/domain/entities/table_details_entity.dart';

part 'table_details_model.freezed.dart';
part 'table_details_model.g.dart';

@freezed
abstract class SimpleTableModel with _$SimpleTableModel {
  const factory SimpleTableModel({
    @JsonKey(name: '_id') required String id,
    required String number,
    required int capacity,
    String? zone,
  }) = _SimpleTableModel;

  factory SimpleTableModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleTableModelFromJson(json);
}

@freezed
abstract class TableCurrentBookingModel with _$TableCurrentBookingModel {
  const factory TableCurrentBookingModel({
    required String guestName,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? notes,
  }) = _TableCurrentBookingModel;

  factory TableCurrentBookingModel.fromJson(Map<String, dynamic> json) =>
      _$TableCurrentBookingModelFromJson(json);
}

@freezed
abstract class TableUpcomingBookingModel with _$TableUpcomingBookingModel {
  const factory TableUpcomingBookingModel({
    required String guestName,
    required String timeSlot,
    required int numberOfGuests,
  }) = _TableUpcomingBookingModel;

  factory TableUpcomingBookingModel.fromJson(Map<String, dynamic> json) =>
      _$TableUpcomingBookingModelFromJson(json);
}

@freezed
abstract class TableDetailsModel with _$TableDetailsModel {
  const factory TableDetailsModel({
    required SimpleTableModel table,
    TableCurrentBookingModel? currentBooking,
    @Default([]) List<TableUpcomingBookingModel> upcomingBookings,
  }) = _TableDetailsModel;

  factory TableDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TableDetailsModelFromJson(json);
}

extension SimpleTableModelX on SimpleTableModel {
  SimpleTableEntity toEntity() => SimpleTableEntity(
        id: id,
        number: number,
        capacity: capacity,
        zone: zone,
      );
}

extension TableCurrentBookingModelX on TableCurrentBookingModel {
  TableCurrentBookingEntity toEntity() => TableCurrentBookingEntity(
        guestName: guestName,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
        endTime: endTime,
        notes: notes,
      );
}

extension TableUpcomingBookingModelX on TableUpcomingBookingModel {
  TableUpcomingBookingEntity toEntity() => TableUpcomingBookingEntity(
        guestName: guestName,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
      );
}

extension TableDetailsModelX on TableDetailsModel {
  TableDetailsEntity toEntity() => TableDetailsEntity(
        table: table.toEntity(),
        currentBooking: currentBooking?.toEntity(),
        upcomingBookings:
            upcomingBookings.map((b) => b.toEntity()).toList(),
      );
}
