import 'package:rxdart/rxdart.dart';
import '../models/theme_model.dart';
import '../resources/repository.dart';

class ThemesBloc {
  final _repository = Repository();
  final _themeFetcher = PublishSubject<ThemeModel>();

  Observable<ThemeModel> get allThemes => _themeFetcher.stream;

  fetchAllThemes() async {
    ThemeModel themeModel = await _repository.fetchAllThemes();
    _themeFetcher.sink.add(themeModel);
  }

  dispose() {
    _themeFetcher.close();
  }
}

final bloc = ThemesBloc();