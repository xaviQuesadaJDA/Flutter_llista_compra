import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class LlistaArticles extends ChangeNotifier {
  Future<List<Article>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/articles'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Error al carregar les dades');
    }
  }

  Future<void> deleteArticle(int id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:3000/articles/$id'));

    if (response.statusCode == 200) {
      notifyListeners();
      return;
    } else {
      throw Exception('Error al carregar les dades');
    }
  }

  Future<void> afegeix(Article article) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/articles/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: article.toJson(),
    );
    notifyListeners();
  }

  void treu(Article article) {
    // _articles.remove(article);

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
    // return _articles[index];
    return Article(id: null, nom: "Article nul", quantity: 0);
  }

  Article getByNom(String nom) {
    // return _articles.firstWhere((article) => article.nom == nom);
    return Article(id: null, nom: "Article nul", quantity: 0);
  }

  int count() {
    // return _articles.length;
    return 0;
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
    if (id != null) {
      data['id'] = id;
    }
    data['nom'] = nom;
    data['quantitat'] = quantity;
    return data;
  }
}
