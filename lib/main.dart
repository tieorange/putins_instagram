import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:putins_instagram/constants.dart';

import 'main_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Scanner',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var text = Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );

    var login = TextFormField(
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Putina login'),
    );
    var password = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Putina password'),
    );

    var imageLogo = Image.network(Constants.instagramLogoUrl);
    const paddingSize = 15.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(paddingSize),
                child: login,
              ),
              Padding(
                padding: const EdgeInsets.all(paddingSize),
                child: password,
              ),
              FlatButton(
                onPressed: onLoginClicked,
                child: Text('Login kurwa'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MainPage(title: 'Main page 222')),
    );
    print("PUTIN JEBLAN");
  }
}
