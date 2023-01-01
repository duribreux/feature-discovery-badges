import 'feature_id.dart';

/// Event that is dispatched when a feature is discovered.
class FeatureDiscoveryEvent {
  FeatureId featureId;
  FeatureDiscoveryEvent({
    required this.featureId,
  });
}
