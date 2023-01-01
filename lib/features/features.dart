import 'package:flutter/material.dart';

import 'feature.dart';
import 'feature_id.dart';

final features = Feature(
  id: FeatureId.home,
  title: 'Home',
  icon: const Icon(Icons.home),
  children: [
    Feature(
      id: FeatureId.news,
      title: 'News',
      icon: const Icon(Icons.new_releases),
      children: [
        Feature(
          id: FeatureId.newsDetail,
          title: 'News Detail',
          icon: const Icon(Icons.article),
          children: [
            Feature(
              id: FeatureId.newsDetailShare,
              title: 'Share',
              icon: const Icon(Icons.share),
              children: [],
            ),
            Feature(
              id: FeatureId.newsDetailBookmark,
              title: 'Bookmark',
              icon: const Icon(Icons.bookmark),
              children: [],
            ),
            Feature(
              id: FeatureId.newsDetailComment,
              title: 'Comment',
              icon: const Icon(Icons.comment),
              children: [],
            ),
          ],
        ),
      ],
    ),
    Feature(
      id: FeatureId.profile,
      title: 'Profile',
      icon: const Icon(Icons.person),
      children: [
        Feature(
          id: FeatureId.profileEmail,
          title: 'Email',
          icon: const Icon(Icons.email),
          children: [],
        ),
        Feature(
          id: FeatureId.profilePassword,
          title: 'Password',
          icon: const Icon(Icons.lock),
          children: [],
        ),
      ],
    ),
    Feature(
      id: FeatureId.settings,
      title: 'Settings',
      icon: const Icon(Icons.settings),
      children: [
        Feature(
          id: FeatureId.settingsNotifications,
          title: 'Notifications',
          icon: const Icon(Icons.notifications),
          children: [
            Feature(
              id: FeatureId.settingsNotificationsPush,
              icon: const Icon(Icons.push_pin),
              title: 'Push',
              children: [],
            ),
            Feature(
              id: FeatureId.settingsNotificationsSms,
              title: 'SMS',
              icon: const Icon(Icons.sms),
              children: [],
            ),
          ],
        ),
        Feature(
          id: FeatureId.settingsAppearance,
          title: 'Appearance',
          icon: const Icon(Icons.color_lens),
          children: [
            Feature(
              id: FeatureId.settingsAppearanceDarkMode,
              title: 'Dark Mode',
              icon: const Icon(Icons.dark_mode),
              children: [],
            ),
            Feature(
              id: FeatureId.settingsAppearanceLanguage,
              title: 'Language',
              icon: const Icon(Icons.language),
              children: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
