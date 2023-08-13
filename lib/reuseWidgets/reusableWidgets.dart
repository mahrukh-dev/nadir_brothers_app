import 'package:flutter/material.dart';
import 'package:nadir_brothers_app/screens/my_address_page.dart';
import 'package:nadir_brothers_app/screens/my_favorites_page.dart';
import 'package:nadir_brothers_app/screens/my_orders.dart';
import 'package:nadir_brothers_app/screens/signin_page.dart';

AppBar customAppBar(){
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    title: const Text(
      "Nadir Brothers",
      style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}

Drawer customDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          accountEmail: Text(
            'Nadir Brothers',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          accountName: Text(''),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.png"),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.deepPurple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        ListTile(
          title: const Text('My Orders'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const MyOrders()
            )
            );
          },
        ),
        ListTile(
          title: const Text('My Addresses'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const MyAddresses()
            )
            );
          },
        ),
        ListTile(
          title: const Text('My Favorites'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const MyFav()
            )
            );
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignIn()
            )
            );
          },
        ),
      ],
    ),
  );
}

Image logoWidget(String ImageName) {
  return Image.asset(
    ImageName,
    fit: BoxFit.fitWidth,
    width: 200,
    height: 200,
  );
}

TextField textFieldWidget(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container reuseButton(
    BuildContext context, String text, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
