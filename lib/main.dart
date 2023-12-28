import 'package:dicoding_restaurant_app/app.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;

import 'features/authentication/services/notification_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
  tzdata.initializeTimeZones();
  runApp(const App());
}
