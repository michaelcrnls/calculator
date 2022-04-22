import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/calulator_provider.dart';
import 'widgets/button_Widgets.dart';

class Calc extends ConsumerWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(calculatorProvider);

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
                    onClicked: () =>
                        ref.read(calculatorProvider.notifier).onClicked(text),
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.green.shade800,
        title: Container(
          // height:size.height ,
          // width: size.width,
          // height: 500,
          //width: 300,
          margin: const EdgeInsets.only(left: 8),
          child: const Text('mi-calculator'),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.result,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 40),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25))),
                child: Column(
                  children: <Widget>[
                    buildButtonRow('AC', '<', '', CalculatorActions.divide),
                    buildButtonRow('7', '8', '9', CalculatorActions.multiply),
                    buildButtonRow('4', '5', '6', CalculatorActions.subtract),
                    buildButtonRow('1', '2', '3', CalculatorActions.add),
                    buildButtonRow(CalculatorActions.zero, '.', '', '='),
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
