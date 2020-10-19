import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Midterm Calculator'),

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

  String output = "0";
  String _output = "";
  double n1 = 0.0;
  double n2 = 0.0;
  String lop = "";

  buttonPressed(String buttonText){
    if(buttonText == "C"){
       _output = "0";
       n1 = 0.0;
       n2 = 0.0;
       lop = "";
    } else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*"){
      n1 = double.parse(output);
      lop = buttonText;
      _output = "0";

    } else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "="){
      n2 = double.parse(output);

      if(lop == "+"){
        _output = (n1 + n2).toString();
      }

      if(lop == "-"){
        _output = (n1 - n2).toString();
      }

      if(lop == "*"){
        _output = (n1 * n2).toString();
      }

      if(lop == "/"){
        _output = (n1 / n2).toString();
      }

      n1 = 0.0;
      n2 = 0.0;
      lop = "";

    } else {
      _output = _output + buttonText;

    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold
          ),),
        onPressed: () => buttonPressed(buttonText),
        color: Colors.black
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(children: <Widget> [
          new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 40.0,
                    horizontal: 24.0
              ),
              child: new Text(output, style: new TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold
              ))),

          new Expanded(
              child: new Divider()),
          new Column(children: [
            new Row(children: [
              buildButton("C"),
              buildButton("+/-"),
              buildButton("%"),
              buildButton("/")
            ]),

            new Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("*")
            ]),

            new Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("-")
            ]),

            new Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("+")
            ]),

            new Row(children: [
              buildButton("0"),
              buildButton("."),
              buildButton("=")
            ])
            ])
          ],
         )));
  }
}
