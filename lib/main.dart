import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db_test/controllers/bookController.dart';
import 'package:local_db_test/controllers/chapterController.dart';
import 'package:local_db_test/controllers/hadithController.dart';
import 'package:local_db_test/controllers/sectionController.dart';
import 'package:local_db_test/routes/routes.dart';
import 'package:local_db_test/views/home.dart';
import 'package:local_db_test/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales:const [Locale('bn'), Locale('en')],
      startLocale:const Locale('bn'),
      saveLocale: true,
      path: 'assets/translations', // Adjust the path to your translation files
      fallbackLocale: const Locale('bn'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hadith App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: ThemeData(
        // Define the default font family for the entire app
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'KALPURUSH', // Replace with your font family name
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            // Add more properties as needed
          ),
          // You can add more text styles here if needed
        ),
        // Other theme customization options
      ),
      initialRoute: RoutePath.splashScreen,
      getPages: [
        GetPage(name:  RoutePath.splashScreen, page: () => const SplashScreen()),
        GetPage(name: RoutePath.home, page: () => HomeScreen()),
        // Define more routes if needed
      ],
      home: const SplashScreen(), // Set initial screen
      // Injecting controllers globally
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BooksController());
        Get.lazyPut(() => SectionController());
        Get.lazyPut(() => HadithController());
        Get.lazyPut(() => ChapterController());
      }),
    );
  }
}
