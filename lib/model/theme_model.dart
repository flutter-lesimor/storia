import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class Theme {
  String id;
  String question;
  Theme(); // 객체를 생성자로 만들어주세요. 그런데 의문! 보통 생성자는 Item(this.serverTime) 이렇게 쓰는데
  // 왜 여기서는 {} 괄호가 추가되었는지 모르겠다. 안쓰면 에러난다. 아는 분 알려주세용 ㅠㅠ
  Theme.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        question = json['question'];
}

Future<List<Theme>> fetchRandomTheme() async {
  final url = 'http://chatflow.ai:4001/talk/theme';
  final response = await http.get(url);

  print(response);
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    print(jsonBody);
    final themes = jsonBody.map((item) => new Theme.fromJson(item)).toList();
    return themes;
    // final _random = new Random();
    // return themes[_random.nextInt(themes.length)];
  } else {
    throw Exception('Failed to load post');
  }
}
