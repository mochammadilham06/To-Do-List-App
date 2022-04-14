import 'package:final_project_todolist/UI/AddTodo.dart';
import 'package:final_project_todolist/UI/LoginPage.dart';
import 'package:final_project_todolist/UI/SigUpPage.dart';
import 'package:final_project_todolist/services/Auth_Service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/LoginPage.dart';
import 'UI/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthGoogle authGoogle = AuthGoogle();
  Widget currentPage = LoginPage();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? token = await authGoogle.getToken();
    print("token");
    if (token != null)
      setState(() {
        currentPage = HomePage();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentPage,
      debugShowCheckedModeBanner: false,
    );
  }
}
