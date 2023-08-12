
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nadir_brothers_app/screens/signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (ctx) => const SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 250,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "Nadir Brothers",
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40)
            ),
            SizedBox(height: 50,),
            SpinKitFadingCircle(
              color: Colors.teal,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }

}