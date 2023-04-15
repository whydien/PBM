import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator BMI',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 31, 103, 219),
              background: Color.fromARGB(255, 31, 103, 219),
              surface: Color.fromARGB(255, 205, 221, 255))),
      initialRoute: "/login",
      routes: {
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage(
              username: username,
              password: password,
            ),
        "/home": (context) => HomePage(
              username: username,
            )
      },
    );
  }
}
