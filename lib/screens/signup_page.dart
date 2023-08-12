import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadir_brothers_app/reuseWidgets/reusableWidgets.dart';
import 'package:nadir_brothers_app/screens/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "SIGN UP PAGE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
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
                textFieldWidget("USERNAME", Icons.account_circle_outlined, false, userController),
                const SizedBox(
                  height: 10,
                ),
                textFieldWidget("EMAIL", Icons.account_circle, false, emailController),
                const SizedBox(
                  height: 10,
                ),
                textFieldWidget("PASSWORD", Icons.lock, true, passController),
                const SizedBox(
                  height: 10,
                ),
                reuseButton(context, 'CREATE ACCOUNT', () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                        const Home()
                    )
                    );
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Create Account Failed")));
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
