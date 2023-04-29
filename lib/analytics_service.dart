/// Track the user's app behavior and send it to Google Analytics
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> setCurrentScreen(String screenName) async {
    await analytics.setCurrentScreen(screenName: screenName);
  }

  static Future<void> setUserId(String? id) async {
    await analytics.setUserId(id: id);
  }

  static Future<void> setUserProperty(String? value) async {
    await analytics.setUserProperty(name: "id_property", value: value);
  }
}
