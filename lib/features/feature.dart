import 'package:flutter/material.dart';

import 'feature_id.dart';

class Feature {
  final FeatureId id;
  final String title;
  final Icon icon;
  final List<Feature> children;

  Feature({
    required this.id,
    required this.title,
    required this.icon,
    required this.children,
  });
}
