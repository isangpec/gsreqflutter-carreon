import "dart:ui";

import "package:flutter/material.dart";

void main() => runApp(ListViewListTileApp());

class ListViewListTileApp extends StatelessWidget {
  const ListViewListTileApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List View and List Tile',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeWidget(title: 'List View and List Tile'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedIndex = 0;
  static const TEXT_STYLE_NORMAL = const TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.normal);
  static const TEXT_STYLE_SELECTED = const TextStyle(
      color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.bold);

  final TextFormField _fontSizeTextField = TextFormField(
    decoration: InputDecoration(
        icon: const Icon(Icons.format_size),
        hintText: 'Font Size',
        labelText: 'Enter Font Size'),
  );

  final TextFormField _historyTextFormField = TextFormField(
    decoration: InputDecoration(
        icon: const Icon(Icons.history),
        hintText: 'Days',
        labelText: 'Enter days'),
  );
  final TextFormField _languageTextFormField = TextFormField(
    decoration: InputDecoration(
        icon: const Icon(Icons.language),
        hintText: 'Language',
        labelText: 'Enter your language'),
  );

  select(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ListTile accessibilityListTile = ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        'Accessibility',
        style: selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('Accessibility Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(0),
    );

    final ListTile historyListTile = ListTile(
      leading: Icon(Icons.history),
      title: Text(
        'History',
        style: selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('History Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(1),
    );

    final ListTile languageListTile = ListTile(
      leading: Icon(Icons.language),
      title: Text(
        'Language',
        style: selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
      ),
      subtitle: const Text('Language Settings'),
      trailing: Icon(Icons.settings),
      onTap: () => select(2),
    );

    final String selectionTitle = (selectedIndex == 0
            ? 'Accessibility'
            : selectedIndex == 1
                ? 'History'
                : 'Language') +
        "Settings";
    final TextFormField selectionTextFormField = selectedIndex == 0
        ? _fontSizeTextField
        : selectedIndex == 1
            ? _historyTextFormField
            : _languageTextFormField;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          accessibilityListTile,
          historyListTile,
          languageListTile
        ],
      ),
      bottomSheet: Container(
        color: Color(0xFFB3E5FC),
        padding: EdgeInsets.all(20.0),
        child: Container(
          constraints: BoxConstraints(maxHeight: 200.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.settings),
              Text(selectionTitle),
              Expanded(child: selectionTextFormField),
            ],
          ),
        ),
      ),
    );
  }
}
