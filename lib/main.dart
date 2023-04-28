import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/google_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: AppLocalizations.supportedLocales,

      home: const GoogleLoginScreen(),
      // home: const HomeScreen(),
    );
    // return FutureBuilder<FirebaseAuth>(
    //     future: FirebaseAuth.instance.currentUser?.email,
    //     builder: (BuildContext context, AsyncSnapshot<FirebaseAuth> snapshot) {
    //       if (snapshot.hasData) {
    //         FirebaseAuth user = snapshot.data!; // this is your user instance
    //         /// is because there is user already logged
    //         return MainScreen();
    //       }

    //       /// other way there is no user logged.
    //       return LoginScreen();
    //     });
  }
}
