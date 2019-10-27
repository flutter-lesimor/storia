import 'package:flutter/cupertino.dart';
import '../models/theme_model.dart';
import '../blocs/themes_bloc.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void didChangeDependencies() {
    // https://medium.com/flutterpub/effective-bloc-pattern-45c36d76d5fe
    bloc.fetchAllThemes();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          child: StreamBuilder(
            stream: bloc.allThemes,
            builder: (context, AsyncSnapshot<ThemeModel> snapshot) {
              if (snapshot.hasData) {
                return buildText(snapshot);
              }
              return Center(child: CupertinoActivityIndicator());
            },
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          alignment: Alignment.center,
        ),
        // floatingActionButton: new FloatingActionButton(
        //     child: new Icon(Icons.add_circle), onPressed: fabPressed)
        );
  }

  void fabPressed() {
    bloc.fetchAllThemes();
  }
}

Widget buildText(AsyncSnapshot<ThemeModel> snapshot) {
  ThemeModel model = snapshot.data;
  return Text(
    model.randomSample.question,
    style: TextStyle(
        fontSize: 20,
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w200,
        fontFamily: "Roboto"),
    softWrap: true,
  );
}
