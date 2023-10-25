import 'package:flutter/material.dart';
import 'package:llista_compra/models/llista_articles.dart';
import 'package:provider/provider.dart';

class ComptadorEnter extends StatelessWidget {
  final int index;

  const ComptadorEnter({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<LlistaArticles>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value.itemAt(index).quantity.toString(),
            ),
            Row(children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => value.incrementa(value.itemAt(index)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => value.decrementa(value.itemAt(index)),
                  ),
                ],
              )
            ]),
          ],
        );
      },
    );
  }
}
