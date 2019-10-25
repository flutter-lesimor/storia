class ThemeModel {
  List<_Result> _results = [];

  ThemeModel.fromJson(Map<String, dynamic> parasedJson) {
    List<_Result> temp = [];
    for (int i = 0; i < parasedJson['results'].length; i++) {
      _Result result = _Result(parasedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;
}

class _Result {
  String _id;
  String _question;
  _Result(result) {
    _id = result['_id'];
    _question = result['question'];
  }

  String get id => _id;
  String get question => _question;
}
