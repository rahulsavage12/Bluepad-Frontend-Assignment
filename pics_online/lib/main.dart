import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> _getCreds() async {
  final pref = await SharedPreferences.getInstance();
  username = pref.getString('username');
  return 'shared preference initiated';
}

var username;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _getCreds().then((value) {
    print(value);
  });
  runApp(MaterialApp(
      home: username != null ? Home() : Login(),
      title: 'Pages',
      routes: {
        '/home': (context) => const Home(),
      }));
}
