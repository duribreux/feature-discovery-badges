import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../features/feature.dart';
import '../features/feature_discovery_event.dart';
import '../features/feature_id.dart';
import '../features/features.dart';
import 'shared_preferences_manager.dart';

@singleton
class FeatureDiscoveryManager extends ChangeNotifier {
  final SharedPreferencesManager _sharedPreferencesManager;
  static final ValueNotifier<FeatureDiscoveryEvent> event = ValueNotifier(
    FeatureDiscoveryEvent(featureId: FeatureId.home),
  );

  FeatureDiscoveryManager(
    this._sharedPreferencesManager,
  );

  /// Dismisses the feature for the given [featureId].
  void dismissFeatureDiscovery(FeatureId featureId) {
    _sharedPreferencesManager.dismissFeatureDiscovery(featureId);
    event.value = FeatureDiscoveryEvent(featureId: featureId);
  }

  /// Returns true if the feature badge for the given [featureId] should be shown.
  bool showFeatureDiscoveryBadge(
    FeatureId featureId,
  ) {
    final feature = _findFeature(features, featureId);

    return !(feature != null && _allSubFeaturesAreVisited(feature));
  }

  /// Returns the feature with the given [id].
  Feature? _findFeature(Feature root, FeatureId id) {
    if (root.id == id) {
      return root;
    }

    for (final child in root.children) {
      final result = _findFeature(child, id);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  /// Returns true if all sub features of the given [feature] are visited.
  bool _allSubFeaturesAreVisited(Feature feature) {
    if (feature.children.isEmpty) {
      return _sharedPreferencesManager.featureAlreadyVisited(feature.id);
    }

    return feature.children.every(_allSubFeaturesAreVisited);
  }
}
