import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/login/views/login.dart';
import 'package:project/login/widget/show-snackBar.dart';
import 'package:project/login/widget/textandbutton.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

var formKey = GlobalKey<FormState>(); //

String? email;
String? password;
bool isloading = false;

class _signUpState extends State<signUp> {
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 65, 91),
          title: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 32, 65, 91),
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "Welcome to \n News Blog",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: "Pacifico"),
                  ),
                ),
                SizedBox(height: 40),
                defaultTextField(
                  onchange: (data) {
                    email = data;
                  },
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultTextField(
                  onchange: (data) {
                    password = data;
                  },
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 32,
                ),
                defaultButton(
                  textcolor: Color.fromARGB(255, 32, 65, 91),
                  background: Colors.white,
                  width: double.infinity,
                  text: "Sign Up",
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await signupuser();
                        ShowBar(context, "Registration Successful");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'badly formatted') {
                          ShowBar(
                              context, "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          ShowBar(context,
                              "The account already exists for that email.");
                        }
                      } catch (e) {
                        ShowBar(context, "An error occurred");
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 200, 221, 236),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signupuser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
