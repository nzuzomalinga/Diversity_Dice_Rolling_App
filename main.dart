import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linked_in_part1/diceRoller.dart';

void main() {
  runApp(MaterialApp(home:Dice()));
}


class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 6,
        title: Text('B  .  L  .  M',style: GoogleFonts.pacifico(),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(child: DiceRoller()),

    );
  }
}


