import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

String logUsername = '';
String logPassword = '';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String username;
  final String password;

  LoginPage({required this.username, required this.password});

  void _submit(BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (logUsername == username && logPassword == password) {
        Navigator.pushNamed(context, '/home',
            arguments: {'username': username});
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Invalid username or password"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "OK",
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text(username),
                //Text(password),
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                  onSaved: (value) {
                    logUsername = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    logPassword = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () => _submit(context),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Berhasil")));
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Belum punya akun?")),
                SizedBox(
                  height: 150,
                )

                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       _formKey.currentState!.save();
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(content: Text("Berhasil")));

                //       Navigator.pushNamed(context, '/home',
                //           arguments: {username: username});
                //     }
                //   },
                //   child: const Text("Login"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
