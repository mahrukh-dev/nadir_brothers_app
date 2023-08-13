import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadir_brothers_app/Backend%20Classes/Categories.dart';
import 'package:nadir_brothers_app/reuseWidgets/reusableWidgets.dart';
import 'package:nadir_brothers_app/screens/home_page.dart';
import 'package:nadir_brothers_app/screens/my_address_page.dart';
import 'package:nadir_brothers_app/screens/my_favorites_page.dart';
import 'package:nadir_brothers_app/screens/my_orders.dart';
import 'package:nadir_brothers_app/screens/signin_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  // List<String> items = [];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      extendBodyBehindAppBar: false,
      appBar: customAppBar(),
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
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
            ),
          ),
        ),
      ),
        drawerEnableOpenDragGesture: true,
      drawer: customDrawer(context),
    );
  }
  //
  // List<String> generateItemsForCategory(int categoryIndex) {
  //   // You can replace this with actual data fetching logic
  //   return List.generate(10, (index) => 'Item ${categoryIndex + 1}-$index');
  // }

}
