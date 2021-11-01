import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RegisterUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const<Widget> [
                    Text( "register",
                      style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                color: Colors.blue,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "userName",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        },
                        child: const Icon(
                            Icons.visibility,
                            color: Colors.black
                        ),
                      ),
                      hintStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(),
                    ),
                  )
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}