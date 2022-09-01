import 'package:flutter/material.dart';
import 'package:ilkuygulamam/models/user.model.dart';
import 'package:ilkuygulamam/services/post.services.dart';
import 'package:ilkuygulamam/services/users.services.dart';

import 'models/post.model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Post Service Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Post Detail Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  UserModel model = UserModel();
  void GetPost(int number) async {
    model = await UsersServices().GetPost(number);
  }

  void NextPost() {
    setState(() {
      _counter++;
      GetPost(_counter);
    });
  }

  void BackPost() {
    setState(() {
      _counter--;
      GetPost(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              model.name ?? '',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () => {BackPost()},
                    icon: const Icon(Icons.remove, color: Colors.redAccent)),
                IconButton(
                    onPressed: () => {NextPost()},
                    icon: const Icon(Icons.add, color: Colors.blueGrey))
              ],
            )
          ],
        ),
      ),
    );
  }
}
