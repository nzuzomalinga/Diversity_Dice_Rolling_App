import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState(){
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: Duration(milliseconds:300),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }



  static var _rnd = new Random();
  static var _diceface = _rnd.nextInt(6) +1 ;

  @override
  Widget build(BuildContext context) {
          return AnimatedBuilder(
            animation: _controller.view,
            builder: (context,child){
               return Transform.rotate(
                   angle:(_diceface%2 ==0)? _controller.value*2*pi : _controller.value*-2*pi ,
               child: child,

               );

            },
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(100.8),
              child:  GestureDetector(

                onTap: () {
                  _controller.value = 0;

                  _controller.forward();

                  setState(() {
                    _diceface = _rnd.nextInt(6) +1 ;
                  });
                },

                child: ClipRect(

                    child: Image(
                      image: AssetImage('images/diceface$_diceface.png'),
                      fit: BoxFit.cover,
                    ),

                )
              ),
            ),
          );
        }
}

