import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid = AndroidInitializationSettings(
      'app_icon',
    );
    // TODO ios configuration

    // await flutterLocalNotificationsPlugin.initialize(

    //   //TODO
    //   // onDidReceiveBackgroundNotificationResponse: (details) {},
    // );
  }
}
