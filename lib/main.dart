import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final inputText = TextEditingController();
  final outputText = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputText.addListener(_convertingText);
  }

  convertText(type, input) {
    // 65-90,91-122,48-57
    // 119808-119833,119834-119859,120782-120791
    if (input >= 65 && input <= 90)
      return String.fromCharCode(119743 + input);
    else if (input >= 91 && input <= 122)
      return String.fromCharCode(119737 + input);
    else if (input >= 48 && input <= 57)
      return String.fromCharCode(120734 + input);
    else
      return String.fromCharCode(input);
  }

  void _convertingText() async {
    var output = inputText.text;
    inputText.text.runes.forEach((int rune) {
      return output =
          output.replaceAll(String.fromCharCode(rune), convertText(2, rune));
    });
    outputText.value = TextEditingValue(text: output);
  }

  

  @override
  Widget build(BuildContext context) {
    TextStyle googleFontHeader = GoogleFonts.cinzel(
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 118, 59, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(bottom: 20.0),
            height: 96,
            child: SizedBox.expand(
              child: Center(child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Text("Portra Rica's ",
                    style: googleFontHeader.copyWith(fontSize: 48)),
                    Positioned(
                      right: 0.0,
                      top: 48.0,
                      child: Text('Weird Character style',style: googleFontHeader.copyWith(fontSize: 20)),
                    )
                  ],
                ),)
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: TextField(
              controller: inputText,
              maxLines: 12,
              decoration: InputDecoration.collapsed(
                hintText: "Enter your text",
                hintStyle: TextStyle(color: Colors.grey)
              ),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: TextField(
              controller: outputText,
              maxLines: 12,
              decoration: InputDecoration.collapsed(
                hintText: "Your output will be here",
                hintStyle: TextStyle(color: Colors.grey)
              ),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        
        ],
      ),
    );
  }
}
