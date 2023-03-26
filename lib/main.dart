import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculator',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: Calculator(),
    )
  );
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  //action for button click 
  int firstnum; 
  int secondnum;
  String texttodisplay = ""; 
  String res; //store result 
  String operatortoperform; //store any operator 

  void btnClicked(String btnval) {
    if(btnval == "C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0; 
      res = ""; 
    }
    else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval; 
    } //if click '+', '-', 'x' or '/' operator 
    else if(btnval == "="){ //if click '=' operator 
      secondnum = int.parse(texttodisplay); 
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString(); 
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString(); 
      }
      if(operatortoperform == "x"){
        res = (firstnum * secondnum).toString(); 
      }
      if(operatortoperform == "/"){
        res = (firstnum / secondnum).toString(); 
      }
    }
    else {
      res = int.parse(texttodisplay + btnval).toString(); //if click numeric button 
    }

    setState(() { //do after any change 
      texttodisplay = res; 
    });
  }

  //custom widget for the button 
  Widget customeButton(String btnval){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator'
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ),
            ),
            Row(
              children: <Widget>[
               customeButton("7"),
               customeButton("8"),
               customeButton("9"),
               customeButton("/")
              ],
            ),
            Row(
              children: <Widget>[
               customeButton("4"),
               customeButton("5"),
               customeButton("6"),
               customeButton("x")
              ],
            ),
            Row(
              children: <Widget>[
               customeButton("1"),
               customeButton("2"),
               customeButton("3"),
               customeButton("-")
              ],
            ),
            Row(
              children: <Widget>[
               customeButton("C"),
               customeButton("0"),
               customeButton("="),
               customeButton("+")
              ],
            ),
          ],
        ),
      ),
    );
  }
}


