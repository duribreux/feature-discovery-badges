import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/feature_id.dart';

@singleton
class SharedPreferencesManager {
  final String featureDiscoveryKey = 'showFeatureDiscovery4-';

  final SharedPreferences _sharedPreferences;

  SharedPreferencesManager(this._sharedPreferences);

  Future<bool> dismissFeatureDiscovery(FeatureId featureId) =>
      _sharedPreferences.setBool(
        '$featureDiscoveryKey${featureId.name}',
        true,
      );

  bool getShowFeatureDiscovery(FeatureId featureId) =>
      _sharedPreferences.getBool('$featureDiscoveryKey${featureId.name}') ??
      false;
}
