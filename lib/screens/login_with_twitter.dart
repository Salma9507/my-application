import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginWithTwitter extends StatefulWidget {
  const LoginWithTwitter({Key? key}) : super(key: key);

  @override
  _LoginWithTwitterState createState() => _LoginWithTwitterState();
}

class _LoginWithTwitterState extends State<LoginWithTwitter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Twitter"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed:
            (){

           signInWithTwitter();
        },
  child: Text("Login")),
      ),
    );
  }

  void signInWithTwitter() async {

    // Create a TwitterLogin instance
    final twitterLogin =TwitterLogin(
        apiKey: 'QrbaOBjTTLDyY5h6id6adRRai',
        apiSecretKey: 'Yy7ahKk8rAKfyD2PIo7cCPGLE6dfeCbWjSki6kOx4UGEpq6zoz',
        redirectURI: 'flutter-twitter-login://',

    );

    // Trigger the sign-in flow
    await twitterLogin.login().then((value) async {

      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    });

  }




}
