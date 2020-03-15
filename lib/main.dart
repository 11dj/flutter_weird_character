import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Weird Character Generator by KittiST'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final inputText = TextEditingController();
  final outputText = TextEditingController();

  final ogChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final tgChar = '𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗';


  void _incrementCounter() {
    final strings = <String>[];
    inputText.text.runes.forEach((int rune) {
      var ty = rune + 119808 - 65;
      var character= String.fromCharCode(ty);
      strings.add(character);
      print('$character : $rune -> $ty === ${strings.join('')}');
    });

    setState(() {
      outputText.text = inputText.text;
    });
  }

  @override
  Widget build(BuildContext context) {

    inputText.text = 'ABCDEFabcdef';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: inputText,
            maxLines: 8,
            decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
            // style: TextStyle(backgroundColor: Colors.green),
          ),
          TextField(
            controller: outputText,
            maxLines: 8,
            decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
