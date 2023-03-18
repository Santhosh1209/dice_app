import 'package:flutter/material.dart';
import 'dart:math'; // for randomizing the dice using random fucntion

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Dice App"),
        centerTitle: true,
      ),
      body: Dice(),
    ),
  ));
}
// buttons - flat button is the button which we are gonna use (Raised button comes with colour)
// flat button : section printed on material components, it also comes with padding on its own
//stless - shortcut for stateless widget

// IMPORTANT NOTES :
// Stateless vs Stafeul widgets:
// - Statless : the state of the widget CANNOT be modified through this
// - Stateful : the state of the widget can be modified, so we'll be using this here as the dice pic has to keep changing

  class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);
  @override
  State<Dice> createState() => _DiceState();
}
class _DiceState extends State<Dice> {
  int leftcount = 1;
  int rightcount = 1;
  void countchange()
  {
    setState(() { // setState is neccesary to get immediate changes on the screen as it marks everything neccesary in the build section of the app
      leftcount = Random().nextInt(6) +1;
      rightcount = Random().nextInt(6) +1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child:
            // Textbutton is the new replacement of the FlatButton
            TextButton
              (onPressed: () {
              countchange();
              },
                child: Image.asset('images/img_$leftcount.png')),
          ),
          Expanded(
            child:
            TextButton
              (onPressed: () {
              countchange();
            },
                child: Image.asset('images/img_$rightcount.png')),
          ),
        ],
      ),
    );
  }
}


