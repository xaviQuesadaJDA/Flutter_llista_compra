import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class LlistaArticles extends ChangeNotifier {
  final List<Article> _articles = [];

  Future<List<Article>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/articles'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  void afegeix(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void treu(Article article) {
    _articles.remove(article);
    notifyListeners();
  }

  void incrementa(Article article) {
    article.quantity += 1;
    notifyListeners();
  }

  void decrementa(Article article) {
    if (article.quantity > 1) {
      article.quantity -= 1;
      notifyListeners();
    }
  }

  Article itemAt(int index) {
    return _articles[index];
  }

  Article getByNom(String nom) {
    return _articles.firstWhere((article) => article.nom == nom);
  }

  int count() {
    return _articles.length;
  }
}

class Article {
  int? id;
  String nom = "";
  int quantity = 0;

  Article({
    required this.id,
    required this.nom,
    required this.quantity,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    quantity = json['quantitat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['quantitat'] = quantity;
    return data;
  }
}
