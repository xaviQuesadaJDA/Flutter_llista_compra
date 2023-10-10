import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField y ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _items = [];

  void _addItemToList(String newItem) {
    setState(() {
      _items.add(newItem);
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField y ListView'),
      ),
      body: ElMeuBody(
        textEditingController: _textEditingController,
        addItemToList: _addItemToList,
        items: _items,
      ),
    );
  }
}

class ElMeuBody extends StatelessWidget {
  final TextEditingController textEditingController;
  final List<String> items;
  final Function(String) addItemToList;

  ElMeuBody({
    required this.textEditingController,
    required this.items,
    required this.addItemToList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: 'Ingrese un texto',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                addItemToList(text);
              }
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text(items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
