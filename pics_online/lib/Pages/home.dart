import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = new ScrollController();
  var username, password;
  List<Widget> images = <Widget>[];
  Future<void> _getCreds() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username');
      password = pref.getString('password');
    });
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  }

  fetchPics() async {
    Random random = new Random();
    int randomNumber1 = random.nextInt(1000);
    int randomNumber2 = random.nextInt(1000);
    setState(() {
      images.add(Image.network(
        'https://picsum.photos/${randomNumber1}/${randomNumber2}.jpg',
        height: 100,
        width: 100,
      ));
    });
  }

  fetchTen() {
    for (int i = 0; i < 10; i++) {
      fetchPics();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCreds();
    fetchTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pics online'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'logout',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You have been logged out')));
                logout();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_box, size: 45),
                    title: Text('username: ${username}'),
                    subtitle: Text('password: ${password}'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                    ),
                    child: images[index],
                  ));
                },
              ),
            ),
          ],
        ));
  }
}
