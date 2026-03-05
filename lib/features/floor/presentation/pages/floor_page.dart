import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';

/// Placeholder floor page — will use InteractiveViewer for floor plan later.
class FloorPage extends ConsumerWidget {
  const FloorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floorsAsync = ref.watch(floorControllerProvider);

    return AppScaffold(
      title: 'Floor Plan',
      body: floorsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (floors) => ListView.builder(
          itemCount: floors.length,
          itemBuilder: (context, index) {
            final floor = floors[index];
            return ListTile(
              title: Text(floor.name),
              subtitle: Text(
                '${floor.tableCount} tables · ${floor.capacity} seats',
              ),
              leading: const Icon(Icons.grid_view_rounded),
            );
          },
        ),
      ),
    );
  }
}
