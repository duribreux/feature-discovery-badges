import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/feature_id.dart';

@singleton
class SharedPreferencesManager {
  final String featureDiscoveryKey = 'showFeatureDiscovery-';

  final SharedPreferences _sharedPreferences;

  SharedPreferencesManager(this._sharedPreferences);

  Future<bool> dismissFeatureDiscovery(FeatureId featureId) =>
      _sharedPreferences.setBool(
        '$featureDiscoveryKey${featureId.name}',
        true,
      );

  bool featureAlreadyVisited(FeatureId featureId) =>
      _sharedPreferences.getBool('$featureDiscoveryKey${featureId.name}') ??
      false;
}
