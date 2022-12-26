import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../injector.dart';
import '../managers/feature_discovery_manager.dart';
import 'feature_discovery_event.dart';
import 'feature_id.dart';

class FeatureBadge extends StatefulWidget {
  final Widget child;
  final FeatureId featureId;

  const FeatureBadge({
    Key? key,
    required this.child,
    required this.featureId,
  }) : super(key: key);

  @override
  State<FeatureBadge> createState() => _FeatureBadgeState();
}

class _FeatureBadgeState extends State<FeatureBadge> {
  final featureDiscoveryManager = getIt.get<FeatureDiscoveryManager>();

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<FeatureDiscoveryEvent>(
        valueListenable: FeatureDiscoveryManager.event,
        builder: (context, event, _) => Badge(
          showBadge: featureDiscoveryManager.showFeatureDiscoveryBadge(
            event.featureId,
          ),
          elevation: 0,
          badgeColor: const Color(0xFFF86868),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
          child: widget.child,
        ),
      );
}
