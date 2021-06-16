import 'dart:async';
import 'dart:io';



import 'package:elshaima/modules/notification/notifications_view.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.data}");
}

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;
  GlobalKey<NavigatorState> navigatorKey;

  FlutterLocalNotificationsPlugin _notificationsPlugin;

  Map<String , dynamic> _not ;

  Future<void> setUpFirebase(GlobalKey<NavigatorState> navigatorKey) async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    this.navigatorKey = navigatorKey;
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
    checkLastMessage();
    firebaseCloudMessaging_Listeners();

    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    _notificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings(
        defaultPresentBadge: true,
        defaultPresentAlert: true,
        defaultPresentSound: true);
    var initSetting = InitializationSettings(android: android, iOS: ios);
    _notificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification );


  }

  Future<void> checkLastMessage() async {
    RemoteMessage initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage!=null) {
      print(initialMessage.data.toString());
      handlePath(initialMessage.data);    }
  }

  Future<void> firebaseCloudMessaging_Listeners() async {
    if (Platform.isIOS) iOS_Permission();

    // _firebaseMessaging.getToken().then((TokenDevice) {
    //   print("TOOOKEN" + TokenDevice);
    //   CacheHelper.saveData(key: "TokenDevice", value: TokenDevice);
    // });



         // ignore: non_constant_identifier_names, missing_return
    // _firebaseMessaging.getToken().then((TokenDevice) {
    //        print("TokenDevice: $TokenDevice");
    //        CacheHelper.saveData(key: "TokenDevice", value: TokenDevice).toString();
    //
    //      });





    FirebaseMessaging.onMessage.listen((RemoteMessage data) {
      print('on message ' + data.data.toString());
      _not = data.data;
      if(Platform.isAndroid) {
        showNotification(
            data.data, data.notification.title, data.notification.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
      print('on Opened ' + data.data.toString());

      handlePath(data.data);
    });

//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//
//         // _onMessageStreamController.add(message);
//         // FlutterRingtonePlayer.playNotification(
//         //   volume: 50,
//         //   asAlarm: true,
//         // );
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print('on resume $message');
// //        navigatorKey.currentState.pushNamed("screen");
// //        _onMessageStreamController.add(message);
// //        FlutterRingtonePlayer.playNotification(
// //          volume: 50,
// //          asAlarm: true,
// //        );
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print('on launch $message');
// //        _onMessageStreamController.add(message);
// //        FlutterRingtonePlayer.playNotification(
// //          volume: 50,
// //          asAlarm: true,
// //        );
//         handlePath(message);
//       },
//     );
  }

  showNotification(
      Map<String, dynamic> _message, String title, String body) async {
    print("Notification Response : $_message");


    var androidt = AndroidNotificationDetails(
        '12', 'CHANNEL_SPIDER', 'channel here Description',
        priority: Priority.high,
        channelShowBadge: true,
        playSound: true,
        ticker: 'ticker',
        icon: "@mipmap/ic_launcher",
        enableVibration: true,
        enableLights: true,
        importance: Importance.max);
    var iost = IOSNotificationDetails();
    var platform = NotificationDetails(android: androidt, iOS: iost);
    await _notificationsPlugin.show(0, title, body, platform, payload: "");
  }

  void iOS_Permission() {
    _firebaseMessaging.requestPermission(
        alert: true, announcement: true, badge: true, sound: true);
    // _firebaseMessaging.requestNotificationPermissions(
    //     IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }

  void handlePath(Map<String, dynamic> dataMap) {
    handlePathByRoute(dataMap);
  }

  Future<void> handlePathByRoute(Map<String, dynamic> dataMap) async {
    String type = dataMap["key"].toString();

    switch(type){

      case "comment_post":await navigatorKey.currentState.pushNamed(Notifications_View.routname); break;
      //case "comment_post":await NamedNavigatorImpl().push(Routes.POST_DETAILS_PAGE_ROUTER  , arguments: int.parse(dataMap['post_id'].toString())); break;
      // case "like_post":await NamedNavigatorImpl().push(Routes.POST_DETAILS_PAGE_ROUTER  , arguments: int.parse(dataMap['post_id'].toString())); break;
      // case "new_chat_message":await Navigator.push(
      //     NamedNavigatorImpl.navigatorState.currentContext,
      //     MaterialPageRoute(
      //         builder: (_) => ChatRoom(
      //           receiverId: int.parse(dataMap['sender_id'].toString()),
      //           receiverName: dataMap['msg_sender'].toString(),
      //         ))); break;
      // case "follow":   await Navigator.push(NamedNavigatorImpl.navigatorState.currentContext, PageRouteBuilder(
      //     pageBuilder: (_ , a , b)=>UserProfilePage(userId: int.parse(dataMap['user_id'].toString()),name: dataMap['msg_sender'].toString(),)
      // )); break;


    }
//    var id = dataMap['data']["id"];
//    var name = dataMap['data']["name"];
//    int counter = int.parse(dataMap['data']["counter"]);
//    switch (path) {
//      case "user":
//        print("truee");
//
//        break;
//      default:
//        print("falsse");
//    }

    // navigatorKey.currentState
    //     .push(MaterialPageRoute(builder: (context) => ChangeLanguagePage()));
  }

  Future onSelectNotification(String payload)  {
    print(payload.toString());
    handlePath(_not);
  }
}