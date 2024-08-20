import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/login/views/signUp.dart';
import 'package:project/login/widget/show-snackBar.dart';
import 'package:project/login/widget/textandbutton.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

GlobalKey<FormState> formKey = GlobalKey(); //

String? email;
String? password;
bool isloading = false;
bool isPassword = true;

class _loginState extends State<login> {
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 65, 91),
          title: Text(
            'Sign In',
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
                  height: 15,
                ),
                defaultTextField(
                  isPassword: isPassword,
                  onchange: (data) {
                    password = data;
                  },
                  suffix: //العين
                      isPassword ? Icons.visibility_off : Icons.visibility,
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  type: TextInputType.name,
                ),
                TextButton(
                    style: ButtonStyle(alignment: Alignment.centerRight),
                    onPressed: () {},
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.white),
                    )),
                defaultButton(
                  textcolor: Color.fromARGB(255, 32, 65, 91),
                  background: Colors.white,
                  width: double.infinity,
                  text: "Log In",
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});

                      try {
                        await loginuser();
                        Navigator.pushNamed(context, 'news', arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ShowBar(context, "No user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          ShowBar(context,
                              "Wrong password provided for that user.");
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
                      "Don't have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "signUp");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 200, 221, 236),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
