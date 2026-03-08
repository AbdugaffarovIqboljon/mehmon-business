import 'package:flutter/material.dart';

enum ChronologyEventType {
  reservationCreated,
  guestArrived,
  reservationCancelled,
  reservationUpdated,
}

extension ChronologyEventTypeX on ChronologyEventType {
  String get title => switch (this) {
    ChronologyEventType.reservationCreated => 'Reservation created',
    ChronologyEventType.guestArrived => 'Guest arrived',
    ChronologyEventType.reservationCancelled => 'Reservation cancelled',
    ChronologyEventType.reservationUpdated => 'Reservation updated',
  };

  String get assetPath => switch (this) {
    ChronologyEventType.reservationCreated =>
      'assets/icons/ic_reservation_created.png',
    ChronologyEventType.guestArrived => 'assets/icons/ic_guest_arrived.png',
    ChronologyEventType.reservationCancelled =>
      'assets/icons/ic_reservation_cancelled.png',
    ChronologyEventType.reservationUpdated =>
      'assets/icons/ic_reservation_updated.png',
  };
}

class ChronologyEventIcon extends StatelessWidget {
  const ChronologyEventIcon({required this.type, super.key});

  final ChronologyEventType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F3F6),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          type.assetPath,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
