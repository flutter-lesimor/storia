import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/theme_model.dart';

class ThemeProvider {
  Client client = Client();

  Future<ThemeModel> fetchThemeList() async {
    print("Entered!");
    final response = await client.get('http://chatflow.ai:4001/talk/theme');
    print(response.body.toString());
    if(response.statusCode == 200){
      return ThemeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load themes');
    }
  }
}