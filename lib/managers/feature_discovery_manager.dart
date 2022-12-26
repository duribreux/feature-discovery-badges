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

  void dismissFeatureDiscovery(FeatureId featureId) {
    _sharedPreferencesManager.dismissFeatureDiscovery(featureId);
    event.value = FeatureDiscoveryEvent(featureId: featureId);
  }

  bool showFeatureDiscoveryBadge(
    FeatureId featureId,
  ) {
    final feature = _findFeatureRoot(features.first, featureId);

    return !(feature != null && _allSubFeaturesAreVisited(feature));
  }

  Feature? _findFeatureRoot(Feature root, FeatureId id) {
    if (root.id == id) {
      return root;
    }

    for (final child in root.children) {
      final result = _findFeatureRoot(child, id);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  bool _allSubFeaturesAreVisited(Feature feature) {
    if (!_sharedPreferencesManager.getShowFeatureDiscovery(feature.id)) {
      return false;
    }

    return feature.children.every(_allSubFeaturesAreVisited);
  }
}
