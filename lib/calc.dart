import 'dart:js';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculus/model/calculator.dart';
import 'package:calculus/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'widgets/button_Widgets.dart';

class Calc extends StatelessWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.green.shade800,
        title: Container(
          // height:size.height ,
          // width: size.width,
          // height: 500,
          //width: 300,
          margin: EdgeInsets.only(left: 8),
          child: Text('mi-calculator'),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(child: buildResult()),
          Expanded(flex: 2, child: buildButtons()),
        ],
      )),
    );
  }

  Widget buildResult() => Consumer(
        builder: (context, watch, child) {
          final state = watch(calculatorProvider.state);

        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                state.equation,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 60),
              ),
              SizedBox(height: 24),
              Text(
                state.result,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 40),
              ),
            ],
          ),
        );
      });

  Widget buildButtons() => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.shade600,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Column(
          children: <Widget>[
            buildButtonRow('AC', '<', '', '/'),
            buildButtonRow('7', '8', '9', '*'),
            buildButtonRow('4', '5', '6', '-'),
            buildButtonRow('1', '2', '3', '+'),
            buildButtonRow('0', '.', '', '='),
          ],
        ),
      );

  Widget buildButtonRow(
    String first,
    String second,
    String third,
    String fourth,
  ) {
    final row = [first, second, third, fourth];

    return Expanded(
      child: Row(
        children: row
            .map((text) => ButtonWidget(
                  text: text,
                  onClicked: () => onClickedButton(text),
                  //onClickedLong: () => print(text),
                ))
            .toList(),
      ),
    );
  }

  

  // void onLongClickedButton(String text) {
  //   final calculator = context.read(calculatorProvider);

  //   if (text == '<') {
  //     calculator.reset();
  //   }
  // }
}