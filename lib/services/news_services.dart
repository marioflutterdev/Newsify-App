import 'package:app_noti/models/category_model.dart';
import 'package:app_noti/models/new_models.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

// https://newsapi.org/v2/top-headlines?country=co&category=business&apiKey=8a28e8ba6e2e478e8d4fb638a596c227
const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '8a28e8ba6e2e478e8d4fb638a596c227';

class NewService extends ChangeNotifier {
  List<Article> headLines = [];
  Map<String, List<Article>> categotyArticles = {};
  String _selectedCategoty = "business";
  List<Categoria> categories = [
    Categoria(FontAwesomeIcons.building, "business"),
    Categoria(FontAwesomeIcons.tv, "entertainment"),
    Categoria(FontAwesomeIcons.addressCard, "general"),
    Categoria(FontAwesomeIcons.headSideVirus, "health"),
    Categoria(FontAwesomeIcons.vials, "science"),
    Categoria(FontAwesomeIcons.volleyball, "sports"),
    Categoria(FontAwesomeIcons.memory, "technology")
  ];
  NewService() {
    getTopHeadLines();

    for (var element in categories) {
      categotyArticles[element.name] = [];
    }
    getCategoryNews(_selectedCategoty);
  }

  String get selectedCategory => _selectedCategoty;

  set selectedCategory(String v) {
    _selectedCategoty = v;
    getCategoryNews(v);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoria =>
      categotyArticles[_selectedCategoty];

  getTopHeadLines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us');
    final resp = await http.get(url);
    final newResponse = NewsResponse.fromJson(resp.body);

    headLines.addAll(newResponse.articles);
    notifyListeners();
  }

  getCategoryNews(String categoria) async {
    if (categotyArticles[categoria]!.isNotEmpty) {
      return categotyArticles[categoria];
    }
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us&category=$categoria');
    final resp = await http.get(url);
    final newResponse = NewsResponse.fromJson(resp.body);

    categotyArticles[categoria]?.addAll(newResponse.articles);

    notifyListeners();
  }
}