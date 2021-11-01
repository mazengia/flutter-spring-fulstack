import 'package:fluter_roject/Screens/home_screen.dart';
import 'package:fluter_roject/users/models/users_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'User Registration Form';
    return ChangeNotifierProvider<UserData>(
      create: (context) => UserData(),
      child: const MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String userName = "";
  String firstName = "";
  String lastName = "";
  String password = "";
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(1.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
           const Padding(
              padding:   EdgeInsets.symmetric( horizontal: 50.0),
              child: Text(
                'SignUp Form',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            TextFormField(
              // textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                // border: OutlineInputBorder(),
                labelText: 'userName',
              ),
              onChanged: (val) {
                userName = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid userName';
                }
                return null;
              },
            ),
            TextFormField(
              // textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'First Name',
              ),
              onChanged: (val) {
                firstName = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid First Name';
                }
                return null;
              },
            ),
            TextFormField(
              // textAlign: TextAlign.center,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Last Name',
              ),
              onChanged: (val) {
                lastName = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid Last Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _controller,
              obscureText: _isObscure,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid password';
                }
                return null;
              },
              onChanged: (val) {
                password = val;
              },
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    try {
                      if (_formKey.currentState!.validate()) {
                        Scaffold.of(context).showSnackBar(const SnackBar(
                            content: Text('Data is in processing.')));
                        Provider.of<UserData>(context, listen: false)
                            .addUsers(userName, firstName, lastName, password);
                      }
                    } catch (e) {
                      Text(e.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                      ),);

                    }
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('ListTasks'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                ),
              ],
            ),
           Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0),
             ),
               clipBehavior: Clip.antiAlias,
               child: Column(
                 children: [
                   Image.asset('images/img.png'),
                   const Text("Burger"
                   ),
                   const Text("Burger"
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
