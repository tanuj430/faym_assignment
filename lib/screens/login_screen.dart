import 'package:faym_assignment/service/authMethods.dart';
import 'package:faym_assignment/screen_components/button.dart';
import 'package:faym_assignment/screen_components/square_button.dart';
import 'package:faym_assignment/screen_components/text_form_field.dart';
import 'package:faym_assignment/screens/home_screen.dart';
import 'package:faym_assignment/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = "", password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Image SizedBox
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                    width: MediaQuery.sizeOf(context).width * .7,
                    child: Image.asset("lib/images/logo3.png"),
                  ),
                  //Welcom Text
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Email Text Field
                  MyTextField(
                    controller: emailController,
                    hintText: "jack@gmail.com",
                    label: "Email",
                    obsecureText: false,
                    icon:
                        Icon(Icons.email_outlined, color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Password Test Field
                  MyTextField(
                    controller: passwordController,
                    hintText: "",
                    label: "Password",
                    obsecureText: true,
                    icon: Icon(
                      Icons.shield_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  
                  SizedBox(height: 10,),
                  //forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot password?",style: TextStyle(
                        color: Colors.black,
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Login Button
                 InkWell(
                     onTap: (){

                      setState(() {
                        if(_formKey.currentState!.validate()){
                            email = emailController.text.toString().trim();
                            password = passwordController.text.toString().trim();
                        }
                      });
                      signIn();
                     },
                     child: MyButton(text:"Sign In"),
                 ),


                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text("Or continue with",style: TextStyle(color: Colors.black54),),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Google Button
                      InkWell(
                        onTap: (){
                          AuthMethods().signInWithGoogle(context);
                        },
                          child: SquareButton(iconImage:"lib/images/google.png",)),

                      SizedBox(width: 30,),
                      // facebook Button
                      SquareButton(iconImage: "lib/images/Facebook.png",),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //Register text and Need an account text
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Need an account?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 6,
                        ),
                      ),
                      TextSpan(
                        text: "Register here",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Navigate to the register page,
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    try {
     UserCredential userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Sign-up Successfully",
            style: TextStyle(fontSize: 20.0),
          )));
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException  catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }
}
