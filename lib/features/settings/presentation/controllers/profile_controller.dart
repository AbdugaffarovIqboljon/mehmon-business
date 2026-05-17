import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mehmon/features/settings/data/datasources/profile_remote_data_source.dart';
import 'package:mehmon/features/settings/data/repositories/profile_repository_impl.dart';
import 'package:mehmon/features/settings/domain/entities/profile_entity.dart';
import 'package:mehmon/features/settings/domain/repositories/profile_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(
    dataSource: ProfileRemoteDataSourceImpl(
      dio: ref.watch(dioClientProvider),
    ),
  );
});

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, ProfileEntity?>(
  ProfileController.new,
);

// ── Controller ────────────────────────────────────────────────────────────

class ProfileController extends AsyncNotifier<ProfileEntity?> {
  @override
  FutureOr<ProfileEntity?> build() async {
    final result =
        await ref.read(profileRepositoryProvider).getProfile();
    return result.when(
      success: (entity) => entity,
      error: (_) => null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(profileRepositoryProvider).getProfile();
      return result.when(
        success: (entity) => entity,
        error: (failure) => throw Exception(failure.message),
      );
    });
  }

  Future<bool> updateProfile({
    String? name,
    String? phone,
    String? cafeName,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
  }) async {
    final result = await ref.read(profileRepositoryProvider).updateProfile(
          name: name,
          phone: phone,
          cafeName: cafeName,
          imageUrl: imageUrl,
          institutionType: institutionType,
          address: address,
          openingTime: openingTime,
          closingTime: closingTime,
        );
    return result.when(
      success: (entity) {
        // Merge with existing state: PUT responses may omit optional fields.
        // Preserving them prevents the router redirect from seeing null values
        // and bouncing the user to /profile-setup mid-save.
        final existing = state.valueOrNull;
        state = AsyncData(
          existing == null
              ? entity
              : entity.copyWith(
                  institutionType:
                      entity.institutionType ?? existing.institutionType,
                  address: entity.address ?? existing.address,
                  imageUrl: entity.imageUrl ?? existing.imageUrl,
                  openingTime: entity.openingTime ?? existing.openingTime,
                  closingTime: entity.closingTime ?? existing.closingTime,
                ),
        );
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> updateZones(List<String> zones) async {
    final result = await ref
        .read(profileRepositoryProvider)
        .updateProfile(zones: zones);
    return result.when(
      success: (entity) {
        // Optimistic: trust the locally-known zones list. The PUT response may
        // omit the zones array, which would otherwise wipe what we just saved.
        final existing = state.valueOrNull;
        state = AsyncData((existing ?? entity).copyWith(zones: zones));
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> completeSetup() async {
    final result = await ref
        .read(profileRepositoryProvider)
        .updateProfile(isSetupCompleted: true);
    return result.when(
      success: (entity) {
        final existing = state.valueOrNull;
        state = AsyncData(
          (existing ?? entity).copyWith(isSetupCompleted: true),
        );
        return true;
      },
      error: (_) => false,
    );
  }

  Future<void> logout() async {
    await ref.read(authControllerProvider.notifier).logout();
    state = const AsyncData(null);
  }
}
