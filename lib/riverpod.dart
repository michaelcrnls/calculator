import 'package:calculus/model/calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider((ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier() : super(Calculator());

  void onClickedButton(String buttonText) {
    final calculator = context.read(calculatorProvider);

        switch (buttonText) {
      case 'AC':
        calculator.reset();
        break;
      case '=':
        calculator.equals();
        break;
      case '<':
        calculator.delete();
        break;
      default:
        calculator.append(buttonText);
        break;
    }
  }

  // void append(String buttonText) {
  //   final equation = () {
  //     return state.equation == '0' ? buttonText : state.equation + buttonText;
  //   }();

  //   state = state.copy(equation: equation);
  // }
}
