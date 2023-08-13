import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodcourt/bindings/bindings.dart';
import 'package:foodcourt/routes/router.dart';
import 'package:foodcourt/screens/splash/splash_screen.dart';
import 'package:foodcourt/themes/theme.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    OrientationBuilder(
      builder: (context, orientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          initialBinding: InitialBindings(),
          title: 'foodcourt',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(context),
          initialRoute: SplashScreen.routeName,
          getPages: AppRouter.routes,
        );
      },
    );
  }
}
