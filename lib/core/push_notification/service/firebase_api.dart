import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:kucc_app/core/push_notification/model/notification_model.dart';
import 'package:kucc_app/core/push_notification/model/notification_user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Only registering Push Notifications to the users who have Signed in

class FirebaseApi {
  static Future<void> initNotificationFirebase() async {
    //TODO : replace with actual states of the user
    const isSignedIn = true;
    const userId = '123';
    const email = 'example@example.com';

    //initialize the firebase messaging and asking notification permission
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    final notificationSettings =
        await messaging.requestPermission(provisional: true);

    if (kDebugMode) {
      print("Notification Settings: $notificationSettings");
    }

    //When the app is in the foreground, the onMessage stream will trigger
    //When the app is running in background check the firebase_messaging_background_handler
    //path:notification_api.dart
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
      }

      if (message.notification != null) {
        if (kDebugMode) {
          print(
              'Message also contained a notification: ${message.notification!.title}');
        }
        //TODO:Update the listeners in the app and update the notification list UI
        final notification = message.notification;
        final Notification = NotificationData(
            title: notification!.title!,
            body: notification.body!,
            imageUrl: notification.android!.imageUrl!);

        if (kDebugMode) {
          print("Notification: $Notification");
        }
      }
    });

    if (isSignedIn) {
      //FCM token is used to send notification to a specific user generated by
      //Firebase Cloud Messaging Package upon agreeing to receive notifications

      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (kDebugMode) {
        print("FCM Token: $fcmToken");
      }
      NotificationUser notificationUser = NotificationUser(
        userId: userId,
        email: email,
        fcmToken: fcmToken!,
      );

      // Add a newly registered user to the database
      addUserToDatabase(notificationUser);
    }
  }

  static void addUserToDatabase(NotificationUser notificationUserModel) {
    FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

    final NotificationUser notificationUser = NotificationUser(
      userId: notificationUserModel.userId,
      email: notificationUserModel.email,
      fcmToken: notificationUserModel.fcmToken,
    );

    firebaseInstance
        .collection('notificationUsers')
        .doc(notificationUserModel.userId)
        .set(notificationUser.toJson())
        .then((value) => {
              if (kDebugMode)
                {print("Notification user added to database successfully")}
            })
        .catchError((error) => {
              if (kDebugMode)
                {print("Failed to add notification user to database: $error")}
            });
  }
}