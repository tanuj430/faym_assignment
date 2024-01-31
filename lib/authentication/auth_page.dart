import 'package:faym_assignment/screens/home_screen.dart';
import 'package:faym_assignment/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          //user logged in
          if(snapshot.hasData){
            return HomeScreen();

            //user not logged in
          }else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}
