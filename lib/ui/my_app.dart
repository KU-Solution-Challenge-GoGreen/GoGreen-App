import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:gogreen_client/ui/home_screen.dart';

import 'package:gogreen_client/ui/explore/explore_screen.dart';
import '../controller/user_controller.dart';
import '../models/profile.dart';
import 'account/set_nickname_screen.dart';
import 'account/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GoGreen',
      theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: const ColorScheme(
            background: Colors.white,
            brightness: Brightness.light,
            error: Colors.red,
            onBackground: Colors.black,
            onError: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.black,
            primary: Color(0xFF21825C),
            secondary: Colors.grey,
            surface: Colors.white,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            labelLarge: TextStyle(
                color: Color(0xFF21825C),
                fontSize: 16,
                fontWeight: FontWeight.bold),
            labelMedium: TextStyle(
              color: Color(0xFF21825C),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            labelSmall: TextStyle(
              color: Color(0xFF21825C),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/': (context) => Home(),
      //   '/setnick_or_dailymeal': (context) => Home(),
      //   '/signin': (context) => SignInScreen(),
      //   '/setnickname': (context) => const SetNicknameScreen(),
      //   '/dailymeal': (context) => DailyMealScreen(),
      // },
      home: const App(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.toString());
          if (snapshot.hasError) {
            return const Center(
              child: Text('Firebase load fail'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const Home();
          } else {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  //Stream<User?> _authStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        FirebaseAuth.instance.authStateChanges().listen((user) async {
          if (user == null) {
            FlutterNativeSplash.remove();

            Get.to(() => const SignInScreen());
            return;
          }

          print("hey! ${FirebaseAuth.instance.currentUser!.uid}");
          Profile? profile = await findUserByToken();
          print(profile);
          if (profile == null) {
            FlutterNativeSplash.remove();

            Get.to(() => const SetNicknameScreen());
            return;
          }
          FlutterNativeSplash.remove();

          Get.off(() => const HomeScreen());
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
    //     print('snapshot1: ${snapshot.data}');
    //     return StreamBuilder<Profile?>(
    //         stream: Stream.fromFuture(
    //             userController.authStateChanges(snapshot.data)),
    //         builder:
    //             (BuildContext context2, AsyncSnapshot<Profile?> snapshot2) {
    //           print('snapshot1: ${snapshot.data}');
    //           print('snapshot2: ${snapshot2.data}');
    //           print('userProfile: ${userController.myProfile}');
    //           Future.delayed(Duration(seconds: 0), () {
    //             if (!snapshot.hasData) {
    //               //return SignInScreen();
    //               Get.to(() => SignInScreen());
    //             } else if (snapshot.hasData &&
    //                 userController.myProfile == null) {
    //               // data가 있고, db에 정보가 없으면 /setnickname으로 이동
    //               //return SetNicknameScreen();
    //               Get.to(() => SetNicknameScreen());
    //             } else {
    //               // data가 있고, db에도 정보가 있으면 바로 메인 페이지로
    //               //return DailyMealScreen();
    //               Get.off(() => DailyMealScreen());
    //             }
    //           });
    //           return Center(child: CircularProgressIndicator());
    //         });
    //   },
    // );
  }
}
