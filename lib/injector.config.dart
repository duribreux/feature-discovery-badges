// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:feature_discovery_badges/managers/feature_discovery_manager.dart'
    as _i5;
import 'package:feature_discovery_badges/managers/shared_preferences_manager.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'di/modules/core_module.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final coreModule = _$CoreModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => coreModule.provideSharedPreferences,
    preResolve: true,
  );
  gh.singleton<_i4.SharedPreferencesManager>(
      _i4.SharedPreferencesManager(gh<_i3.SharedPreferences>()));
  gh.singleton<_i5.FeatureDiscoveryManager>(
      _i5.FeatureDiscoveryManager(gh<_i4.SharedPreferencesManager>()));
  return getIt;
}

class _$CoreModule extends _i6.CoreModule {}
