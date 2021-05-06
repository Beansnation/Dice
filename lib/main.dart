import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
 debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicey'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //variables are declared above the build function
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  //a function that allows user to generate a radom number from 1 to 6
  //the Random Class allows for number from 0, but there is no dice with a 0 number
  //therefore 1 needs to be added to complement for that
  void changeDiceNumber(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: (){
                    changeDiceNumber();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),),
              ),
            ),
            //Expanded is being used because the dice image is bigger than the screen{512 X 512)
            //the dice images take the available space provided by the screen and resizes itself
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: (){
                    changeDiceNumber();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



