import 'package:faym_assignment/screen_components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){

    FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomeScreen"),
            InkWell(
                onTap: (){
                  _auth.signOut();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: MyButton(text: "Sign-Out"),
                )),

          ],
        ),
      )
    );
  }
}
