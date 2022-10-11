// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_expenses/pages/root_app.dart';
// import 'package:shared_expenses/scoped_model/usermodel.dart';
// import 'package:js/js.dart';
// import 'dart:html';
//
//
// class emailsignuppage extends StatefulWidget {
//
//   @override
//   State<emailsignuppage> createState() => _emailsignuppageState();
// }
//
// class _emailsignuppageState extends State<emailsignuppage> {
//   final formKey = GlobalKey<FormState>();
//
//   final _auth = FirebaseAuth.instance;
//
//   bool isLoading = false;
//
//   TextEditingController usernameController = new TextEditingController();
//
//   TextEditingController emailController = new TextEditingController();
//
//   TextEditingController passwordController = new TextEditingController();
//
//   signMeUp() async{
//     if(formKey.currentState.validate()){
//       setState((){
//         formKey.currentState.save();
//         isLoading = true;
//       });
//
//       print(usernameController.text);
//       print(emailController.text);
//       print(passwordController.text);
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isLoading ? Center(child: Container(child: CircularProgressIndicator(color: Colors.deepPurpleAccent.shade100,),)): Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("SHARES EXPENSES", style: TextStyle(
//                 fontSize: 40
//             ),),
//
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(controller: usernameController,
//
//                       validator: (val){
//                         if(val == null || val.isEmpty || val.toString().length<4 ){
//                           return "This field should have more than 4 characters";
//                         }
//                         else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(hintText: 'Username',enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         BorderSide(width: 1, color: Colors.deepPurpleAccent.shade100),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.deepPurpleAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),),),
//                     //UserName
//                     SizedBox(height: 15,),
//                     TextFormField(controller: emailController,
//                       // validator: (val){
//                       //   return RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]").hasMatch(val!) ? null : "Enter correct email";
//                       // },
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return ("Please Enter Your Email");
//                           }
//                           // reg expression for email validation
//                           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                               .hasMatch(value)) {
//                             return ("Please Enter a valid email");
//                           }
//                           return null;
//                         },
//                       decoration: InputDecoration(hintText: 'Email',enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         BorderSide(width: 1, color: Colors.deepPurpleAccent.shade100),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.deepPurpleAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),),),
//                     SizedBox(height: 15,),//Email
//
//                     TextFormField(controller: passwordController,
//                       validator: (val){
//                         return val.length > 6 ? null : "Password should be atleast 6 characters long";
//                       },
//                       obscureText: true,
//                       decoration: InputDecoration(hintText: 'Password',enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         BorderSide(width: 1, color: Colors.deepPurpleAccent.shade100),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.deepPurpleAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(width: 1, color: Colors.redAccent),
//                           borderRadius: BorderRadius.circular(15),
//                         ),),),],
//                 ),
//               ),
//             ),
//                                                                     //Password
//             SizedBox(height: 20,),
//             Container(
//               decoration:
//               BoxDecoration(color: Colors.deepPurpleAccent.shade100),
//
//               child: FlatButton(
//                 onPressed: () {
//                  // signUp(usernameController.text, emailController.text, passwordController.text);
//                 },
//                 child: Text('Sign-Up'),
//               ),
//             ),
//             SizedBox(height: 10,),
//             Row(
//               mainAxisAlignment:MainAxisAlignment.center,
//               children: [
//                 Text('Already have an account?'),
//                 TextButton(onPressed: (){
//                   Navigator.pop(context);
//                 }, child: Text('Sign in'))
//               ],)
//           ],
//         ),
//       ),
//     );
//   }
//
//   void signUp(String username, String email, String password) async{
//     if(formKey.currentState.validate()){
//       await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {postDetailsToFirestore()}).catchError((e){print('e');});
//     }
//   }
//   postDetailsToFirestore() async{
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//     User user = _auth.currentUser;
//
//     UserModel userModel = UserModel();
//
//     userModel.email= user.email;
//     userModel.uid = user.uid;
//     userModel.username = usernameController.text;
//     await firebaseFirestore
//     .collection("users")
//     .doc(user.uid)
//     .set(userModel.toMap());
//
//     Fluttertoast.showToast(msg: "Account created successfully!!");
//
//     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RootApp()), (route) => false);
//   }
// }
