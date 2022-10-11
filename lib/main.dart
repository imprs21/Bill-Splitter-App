import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_expenses/pages/email_password_login_scr.dart';
import 'package:shared_expenses/pages/root_app.dart';
import 'package:shared_expenses/scoped_model/expenseScope.dart';
import 'package:js/js.dart';
import 'dart:html';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseModel myExpenseModel = ExpenseModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ExpenseModel>(
      model: myExpenseModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: emailloginhome(),
      ),
    );
  }
}
