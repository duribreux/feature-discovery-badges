import 'package:flutter/material.dart';

import 'features/feature.dart';
import 'features/feature_badge.dart';
import 'features/features.dart';
import 'injector.dart';
import 'managers/feature_discovery_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Feature Discovery Badges Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Feature Discovery Badges Demo'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => getIt.get<FeatureDiscoveryManager>().clear(),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [buildFeature(features)],
            ),
          ),
        ),
      );

  Widget buildFeature(
    Feature feature, {
    double depth = 1,
  }) {
    final tile = feature.children.isEmpty
        ? ListTile(
            leading: FeatureBadge(
              featureId: feature.id,
              child: feature.icon,
            ),
            title: Text(feature.title),
          )
        : ExpansionTile(
            title: Text(feature.title),
            childrenPadding: EdgeInsets.only(left: depth * 16),
            leading: FeatureBadge(
              featureId: feature.id,
              child: feature.icon,
            ),
            children: feature.children
                .map((element) => buildFeature(element, depth: depth + 1))
                .toList(),
          );

    return InkWell(
      onTap: () => getIt
          .get<FeatureDiscoveryManager>()
          .dismissFeatureDiscovery(feature.id),
      child: tile,
    );
  }
}
