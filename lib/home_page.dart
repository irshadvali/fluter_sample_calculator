
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var number1 , number2 , result=0.0 ;

  final TextEditingController inputText1 = new TextEditingController(text: "0");
  final TextEditingController inputText2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      number1 = double.parse(inputText1.text);
      number2 = double.parse(inputText2.text);
      result = number1 + number2;
    });
  }

  void doSub() {
    setState(() {
      number1 = double.parse(inputText1.text);
      number2 = double.parse(inputText2.text);
      result = number1 - number2;
    });
  }

  void doMul() {
    setState(() {
      number1 = double.parse(inputText1.text);
      number2 = double.parse(inputText2.text);
      result = number1 * number2;
    });
  }

  void doDiv() {
    setState(() {

      number1 = double.parse(inputText1.text);
      number2 = double.parse(inputText2.text);
      if(number2==0){
        AlertDialog dialog=new AlertDialog(
          content: new Text("Can not divide by zero."),
        );
        showDialog(context: context, child: dialog);
        result=0.0;

      }
      else{

        result = (number1 / number2).toStringAsFixed(2);
      }

    });
  }

  void doClear() {
    setState(() {
      inputText1.text = "0";
      inputText2.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output : $result",
              style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 1"),
              controller: inputText1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 2"),
              controller: inputText2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: doAddition,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: doSub,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: doMul,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: doDiv,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: doClear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
