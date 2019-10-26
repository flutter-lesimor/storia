import 'dart:math';

class ThemeModel {
  List<Theme> _results = [];
  Random rnd = new Random();

  ThemeModel.fromJson(Map<String, dynamic> parasedJson) {
    List<Theme> temp = [];
    for (int i = 0; i < parasedJson['results'].length; i++) {
      Theme result = Theme(parasedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Theme> get results => _results;
  Theme get randomSample => randomListItem(_results);
  dynamic randomListItem(List<dynamic> lst) => lst[rnd.nextInt(lst.length)];
}

class Theme {
  String _id;
  String _question;
  Theme(result) {
    _id = result['_id'];
    _question = result['question'];
  }

  String get id => _id;
  String get question => _question;
}
