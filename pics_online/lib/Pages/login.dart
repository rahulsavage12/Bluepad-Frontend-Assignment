import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username = '';
  var password = '';
  var auth_error = '';
  Future<void> _setCreds(String username, String password) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('username', username);
    pref.setString('password', password);
  }

  Future<void> _authenticate(String username, String password) async {
    if (username == 'admin' && password == 'admin123') {
      setState(() {
        auth_error = '';
      });
      _setCreds(username, password).then((value) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      });
    } else {
      setState(() {
        auth_error = ' The username or password is incorrect';
      });
    }
    if (username == '' || password == '') {
      setState(() {
        auth_error = ' Kindly enter all the fields';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
          width: 250.0,
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter a unique username'),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password'),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    }),
              ),
              Text(
                auth_error,
                style: TextStyle(color: Colors.red),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  _authenticate(username, password);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
