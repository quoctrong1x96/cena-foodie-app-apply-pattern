import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  // ignore: non_constant_identifier_names
  final String MESSAGE_CLOUD_KEY =
      "AAAAQNNeA9c:APA91bFcbO4NAwmV_AuAhsOakIriqjryLRunKn2__NVJIxt_EFZbhkAqVWNBO90DbjMf39WQ0F1z4F4laFSjlEmP7d6GM5CAbvjrElChkAZFJs9xHes_bwS91xUUkN-vISlr6wRI3CL_";
  late AndroidNotificationChannel channel;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void initNotification() async {
    channel = const AndroidNotificationChannel(
        'high_importance_channel', 'High Importance Notifications',
        description: 'This channel is used for important notifications',
        importance: Importance.high);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  void onMessagingListener() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        // ignore: avoid_print
        print('PUSH NOTIFICACION : $message');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: 'launch_background')));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('NUEVA NOTIFICACION : $message');
    });
  }

  Future<String?> getNotificationToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  Future<void> sendNotification(
      String to, Map<String, dynamic> data, String title, String body) async {
    Uri uri = Uri.https('fcm.googleapis.com', '/fcm/send');

    await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$MESSAGE_CLOUD_KEY'
        },
        body: jsonEncode(<String, dynamic>{
          'notification': {'body': body, 'title': title},
          'priority': 'high',
          'ttl': '4500s',
          'data': data,
          'to': to
        }));
  }

  Future<void> sendNotificationMultiple(List<String> toList,
      Map<String, dynamic> data, String title, String body) async {
    Uri uri = Uri.https('fcm.googleapis.com', '/fcm/send');

    await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$MESSAGE_CLOUD_KEY'
        },
        body: jsonEncode(<String, dynamic>{
          'notification': {'body': body, 'title': title},
          'priority': 'high',
          'ttl': '4500s',
          'data': data,
          'registration_ids': toList
        }));
  }
}

final pushNotification = PushNotification();
