import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadir_brothers_app/screens/home_page.dart';
import 'package:nadir_brothers_app/screens/signup_page.dart';
import '../reuseWidgets/reusableWidgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.deepPurple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                textFieldWidget("Enter User", Icons.account_circle_outlined,
                    false, userController),
                const SizedBox(
                  height: 20,
                ),
                textFieldWidget("Enter Password", Icons.lock_outline_rounded,
                    true, passController),
                const SizedBox(
                  height: 15,
                ),
                reuseButton(context, 'SIGN IN', () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: userController.text, password: passController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Home()
                    )
                    );
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wrong email/password")));
                  });
                }),

                const SizedBox(
                  height: 5,
                ),
                //reuseButton(context, 'SIGN UP', () {}),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "DONT HAVE ACCOUNT? ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Sign Up ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
