import 'package:faym_assignment/screen_components/button.dart';
import 'package:faym_assignment/screen_components/text_form_field.dart';
import 'package:faym_assignment/screens/home_screen.dart';
import 'package:faym_assignment/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileNumberController = TextEditingController();

  String email = "", password = "" , userName = "", mobileNo = "";
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                    width: MediaQuery.sizeOf(context).width * .7,
                    child: Image.asset("lib/images/logo3.png"),
                  ),
                  MyTextField(
                      controller: userNameController,
                      hintText: "Tanuj yadav",
                      label: "UserName",
                      obsecureText: false,
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: emailController,
                      hintText: "tanujyadav430@gmail.com",
                      label: "Email",
                      obsecureText: false,
                      icon: Icon(Icons.email_outlined)),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: mobileNumberController,
                      hintText: "+91 7500514437",
                      label: "Mobile Number",
                      obsecureText: false,
                      icon: Icon(Icons.phone)),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: passwordController,
                      hintText: "",
                      label: "Password",
                      obsecureText: true,
                      icon: Icon(Icons.shield_outlined)),
                  SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          loading = true;
                          email = emailController.text.toString().trim();
                          password = passwordController.text.toString().trim();
                          userName = userNameController.toString().trim();
                          mobileNo = mobileNumberController.text.toString().trim();
                          registration();
                        });
                      }

                    },
                      child:loading == true ?
                      CircularProgressIndicator(color: Colors.white): MyButton(text: "Register")),
                  SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ),
                      ),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
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
  void registration() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //success code
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Sign-up Successfully",
            style: TextStyle(fontSize: 15,),
          )));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((error) {
      //catch error code here
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "${error}",
            style: TextStyle(fontSize: 15,),
          )));
    });

   }
}
