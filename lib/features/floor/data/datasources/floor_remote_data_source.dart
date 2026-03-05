import 'package:mehmon/features/floor/data/models/floor_model.dart';

/// Remote data source contract for floor operations.
abstract class FloorRemoteDataSource {
  Future<List<FloorModel>> getFloors();
  Future<FloorModel> getFloorById(String id);
}

/// Dummy implementation returning mock data.
class DummyFloorRemoteDataSource implements FloorRemoteDataSource {
  @override
  Future<List<FloorModel>> getFloors() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      FloorModel(id: 'fl_01', name: 'Main Hall', tableCount: 12, capacity: 48),
      FloorModel(id: 'fl_02', name: 'Terrace', tableCount: 8, capacity: 32),
      FloorModel(id: 'fl_03', name: 'VIP Room', tableCount: 4, capacity: 16),
    ];
  }

  @override
  Future<FloorModel> getFloorById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const FloorModel(
      id: 'fl_01',
      name: 'Main Hall',
      tableCount: 12,
      capacity: 48,
    );
  }
}
