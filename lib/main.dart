import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:no_swimming_admin_app/ViewModel/book_view_model.dart';
import 'package:no_swimming_admin_app/ViewModel/feedback_view_model.dart';
import 'package:no_swimming_admin_app/ViewModel/journal_view_model.dart';
import 'firebase_options.dart';
import 'package:no_swimming_admin_app/ViewModel/student_list_view_model.dart';
import 'package:no_swimming_admin_app/View/Screen/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );
  requestPermission();
  final FlutterLocalNotificationsPlugin notiPlugin =
      FlutterLocalNotificationsPlugin();
  await notiPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      if (message.notification != null) {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        await preferences.clear();
        notiPlugin.show(
          message.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    },
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 930),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StudentListViewModel()),
            ChangeNotifierProvider(create: (context) => JournalViewModel()),
            ChangeNotifierProvider(create: (context) => FeedbackViewModel()),
            ChangeNotifierProvider(create: (context) => BookViewModel()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          ),
        );
      },
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  print("Handling a background message: ${message.messageId}");
}

Future requestPermission() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
