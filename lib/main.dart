import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:no_swimming_admin_app/screen/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/provider/school_year_list_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 930),
      builder: (context, child) {
        return ChangeNotifierProvider<SchoolYearListProvider>(
          create: (context) => SchoolYearListProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          ),
        );
      },
    );
  }
}
