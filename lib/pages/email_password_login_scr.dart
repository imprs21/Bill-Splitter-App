import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_expenses/pages/root_app.dart';
import 'package:shared_expenses/pages/signup.dart';
import 'package:js/js.dart';
import 'dart:html';

class emailloginhome extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SHARED EXPENSES",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,

                      // validator: (val){
                      //   return RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]").hasMatch(val!) ? null : "Enter correct email";
                      // },
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.deepPurpleAccent.shade100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Email',
                      ),
                    ), //Email

                    SizedBox(height: 15,),

                    TextFormField(
                      controller: passwordController,

                      validator: (val) {
                        return val.length > 5
                            ? null
                            : "Password should be atleast 6 characters long";
                      },
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password',enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.deepPurpleAccent.shade100),
                        borderRadius: BorderRadius.circular(8),
                      ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1, color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(15),
                        ),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 140,
              decoration:
                  BoxDecoration(color: Colors.deepPurpleAccent.shade100, borderRadius: BorderRadius.circular(15)),
              child: FlatButton(
                onPressed: () {
                  signIn(
                      emailController.text, passwordController.text, context);
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => emailsignuppage()));
                  },
                  child: Text('Create one'),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Forgot password?'),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password, BuildContext context) async {
    if (_formkey.currentState.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "Logged in", backgroundColor: Colors.grey)
              });

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => RootApp()));
    }
  }
}
