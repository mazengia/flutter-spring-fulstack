import 'dart:async';

import 'package:fluter_roject/users/screens/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  String title="Home Page";

  SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
        debugShowCheckedModeBanner: false,
     home: MyHomePage(),
    );
  }

}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);
    @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage>{
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const Register()//after 5 second register class is called
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }

}
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:const Text("Splash Screen Example")),
//       body: const Center(
//           child:Text("Welcome to Home Page",
//               style: TextStyle( color: Colors.black, fontSize: 30)
//           )
//       ),
//     );
//   }
// }
