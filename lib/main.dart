import 'package:bloc/bloc.dart';
import 'package:elshaima/modules/login/login_view.dart';
import 'package:elshaima/shared/bloc_observer.dart';

import 'package:elshaima/modules/child/child_view.dart';
import 'package:elshaima/modules/home/home_view.dart';
import 'package:elshaima/modules/splash/splash_view.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';
import 'package:elshaima/shared/network/remote/dio_helper.dart';
import 'package:elshaima/shared/styles/colors.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'modules/notification/handel_notification.dart';
import 'modules/notification/notifications_view.dart';
import 'shared/components/constance.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseNotifications().setUpFirebase( MyApp.navigatorKey);
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  // ignore: non_constant_identifier_names
Token = CacheHelper.getData(key: "token");


  if (Token != null) {
    widget = Splash();
  } else {
    widget =  Splash();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatefulWidget {
  final Widget startWidget;

  static final navigatorKey = GlobalKey<NavigatorState>();

  MyApp({this.startWidget});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();

    getToken();

  }

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget.startWidget,
        // initialRoute: Splash.routname,
        // onGenerateRoute: routes,
        title: 'Elshaima',
        theme: ThemeData(
            fontFamily: "cairo",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: primaryColor,
                  statusBarIconBrightness: Brightness.light),
              backgroundColor: primaryColor,
            )),
      navigatorKey:  MyApp.navigatorKey,
           routes: {
             HomeScreen.routname:(ctx)=>HomeScreen(),
             ChildScreen.routname:(ctx)=>ChildScreen(),
             Notifications_View.routname:(ctx)=>Notifications_View(),
           //  Splash.routname:(ctx)=>Splash(),
           },

    );
  }

 //
  getToken() async {
    TokenDevice = await FirebaseMessaging.instance.getToken();
    setState(() {
      TokenDevice = TokenDevice;
    });
    print("TokenDevice: $TokenDevice");
 CacheHelper.saveData(key: "TokenDevice", value: TokenDevice);

  }


}
