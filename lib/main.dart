
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pionix_app/screens/login_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Login & SignUp',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        //LoginScreen(),
    );

  }
}
