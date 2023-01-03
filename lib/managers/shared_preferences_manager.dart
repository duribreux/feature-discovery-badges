import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/feature_id.dart';

@singleton
class SharedPreferencesManager {
  final String featureDiscoveryKey = 'showFeatureDiscovery-';

  final SharedPreferences _sharedPreferences;

  SharedPreferencesManager(this._sharedPreferences);

  /// Dismisses the feature for the given [featureId].
  Future<bool> visiteFeature(FeatureId featureId) => _sharedPreferences.setBool(
        '$featureDiscoveryKey${featureId.name}',
        true,
      );

  /// Returns true if the feature badge for the given [featureId] should be shown.
  bool featureVisited(FeatureId featureId) =>
      _sharedPreferences.getBool('$featureDiscoveryKey${featureId.name}') ??
      false;

  /// Clears all data.
  Future<void> clear() => _sharedPreferences.clear();
}
