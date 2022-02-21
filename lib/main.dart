//Package
import '/Screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//Pages
import 'Screens/signin.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/Profile.dart';
//theme
import 'Theme/main_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: const FirebaseOptions(
      apiKey: "AIzaSyC1hA90TjDEVnusL41lfS_i4JZ9Q_Y-dc8", // Your apiKey
      appId: "1:1002089328016:android:2000e0bc4fec1d066d9715", // Your appId
      messagingSenderId: "1002089328016", // Your messagingSenderId
      projectId: "lglsipfe", // Your projectId
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusWay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:false,
        initialRoute: '/', //First phase of the App
        routes: {
          //'/': (context) => Loading(),
          '/': (context) => const loginscreen(),
          '/dash': (context) => const Dashboard(),
          '/profile': (context) => const Profile(),
          '/home': (context) => const HomeScreen(),
          //'/dash': (context) => Dashboard(),
        }
    );
  }
}


/*
=> runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    /*Dark Theme
    themeMode: ThemeMode.system,
    theme: MyThemes.lightTheme,
    darkTheme: MyThemes.darkTheme,
     */
    initialRoute: '/', //First phase of the App
    routes: {
      //'/': (context) => Loading(),//SpalshScreen
      '/': (context) => const Dashboard(),
      '/profile': (context) => const Profile(),
      '/home': (context) => const HomeScreen(),
      //'/dash': (context) => Dashboard(),


    }

)


);
 */