import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notification.',
    importance: Importance.max, playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

initializeNotification() async {
  try {
    final fcm = FirebaseMessaging.instance;
    // if (Platform.isIOS) {
    //   await fcm.requestPermission(
    //     alert: true,
    //     badge: true,
    //     sound: true,
    //   );

    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((_onMessage) {
      debugPrint("true1");
    });
    FirebaseMessaging.onBackgroundMessage((_onBackgroundMessage) async {
      debugPrint("true2");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((_onOpened) {
      debugPrint("true3");
    });
  } catch (e) {
    print(e);
  }
}
//}

// void _onMessage(RemoteMessage message) {
//   debugPrint("Kamu menerima pesan! ${message.notification?.title}");
//   debugPrint("${message.notification?.body}");
//   RemoteNotification notification = message.notification;
//   AndroidNotification android = message.notification?.android;
//   print(notification);
//   print(android);
//   if (notification != null && android != null) {
//     // ignore: missing_return
//     showDialog(
//         builder: (_) {
//           return AlertDialog(
//             title: Text(notification.title),
//             content: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text(notification.body)],
//               ),
//             ),
//           );
//         },
//         context: null);
//   }
// }

// Future<void> _onBackgroundMessage(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint("Kamu menerima pesan! ${message.notification?.title}");
//   debugPrint("${message.notification?.body}");
//   RemoteNotification notification = message.notification;
//   AndroidNotification android = message.notification?.android;
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           color: Colors.blue,
//           playSound: true,
//         ),
//       ),
//     );
//   }
// }

// void _onOpened(RemoteMessage message) async {
//   final data = message.data;
//   debugPrint("Kamu bisa melakukan apapun pada data! $data");
// }

Future<void> onTerminated() async {
  final fcm = FirebaseMessaging.instance;
  final message = await fcm.getInitialMessage();
  debugPrint(
      "TOKEN FCM: ${(await FirebaseMessaging.instance.getToken()).toString()} ");
  if (message != null) {
    final data = message.data;
    debugPrint("Kamu bisa melakukan apapun pada data! $data");
  }
}
