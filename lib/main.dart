import 'package:flutter/material.dart';
import 'package:storia/model/theme_model.dart';
import 'package:storia/model/theme_model.dart' as ThemeModel;
import "dart:math";

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String _text = "안녕하세요!";
  List<ThemeModel.Theme> themes = [];
  @override
  Widget build(BuildContext context) {
    // final themes = await fetchRandomTheme();
    return Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: fetchRandomTheme(),
            initialData: Center(child: CircularProgressIndicator()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                themes = snapshot.data;
                print(snapshot);
                // getRandomTheme();
                return Center(
                    child: Text(
                  _text,
                  style: new TextStyle(
                      fontSize: 50.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ));
              } else if (snapshot.hasError) {}
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh), onPressed: getRandomTheme),
    );
  }

  void fabPressed() {
    print('click!');
    _text = 'bb';
  }

  void getRandomTheme() {
    final _random = new Random();
    if (themes == null) {
    } else if (themes.length == 0) {
    } else {
      final one = themes[_random.nextInt(themes.length)];
      _text = one.question;
    }
  }
}
