import 'package:flutter/material.dart';
import 'package:llista_compra/main.dart';

class ComptadorEnter extends StatefulWidget {
  final String textArticle;
  const ComptadorEnter({super.key, required this.textArticle});

  @override
  // ignore: library_private_types_in_public_api
  _ComptadorEnterState createState() => _ComptadorEnterState(tA: textArticle);
}

class _ComptadorEnterState extends State<ComptadorEnter> {
  int comptador = 1;
  String tA;

  _ComptadorEnterState({required this.tA});

  void _incrementa() {
    setState(() {
      comptador++;
    });
  }

  void _decrementa() {
    setState(() {
      if (comptador > 0) {
        comptador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$comptador ' + tA,
        ),
        Row(children: [
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _incrementa,
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrementa,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _decrementa,
          )
        ]),
      ],
    );
  }
}
