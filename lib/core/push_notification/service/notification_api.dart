import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:kucc_app/core/push_notification/model/notification_model.dart';

/*
Since the handler runs in its own isolate outside your applications context,
it is not possible to update application state or execute any UI impacting logic.
You can, however, perform logic such as [HTTP requests], perform IO operations
(e.g. [updating local storage]), communicate with other plugins etc.
*/

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  // TODO:Initialize firebase app

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }

  //Create a Notification Model and push it to app
  final notification = message.notification;
  final Notification = NotificationData(
      title: notification!.title!,
      body: notification.body!,
      imageUrl: notification.android!.imageUrl!);
}
