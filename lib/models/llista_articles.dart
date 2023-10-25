import "package:flutter/material.dart";

class LlistaArticles extends ChangeNotifier {
  final List<Article> _articles = [];

  void add(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void remove(Article article) {
    _articles.remove(article);
    notifyListeners();
  }
}

class Article {
  int? id;
  String nom = "";
  int? quantity = 0;

  Article({
    required this.id,
    required this.nom,
    required this.quantity,
  });
}
