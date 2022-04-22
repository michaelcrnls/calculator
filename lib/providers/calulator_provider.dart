import 'package:expressions/expressions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calculator_state.dart';

class CalculatorActions {
  static const String add = '+';
  static const String subtract = '-';
  static const String divide = '/';
  static const String multiply = '*';
  static const String one = '1';
  static const String two = '2';
  static const String zero = '0';
  static const String equalTo = '=';
  // reset,
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>(
        (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  CalculatorNotifier() : super(CalculatorState());

  void onClicked(String action) {
    print(state.lastAction);

    if (action == CalculatorActions.equalTo) {
      equalTo();
    } else {
      append(action);
    }
    state = state.copy(lastAction: action);
  }

  void equalTo() {
    var expression = Expression.parse(state.result);

    const evaluator = ExpressionEvaluator();
    var result = evaluator.eval(expression, {});

    state = state.copy(result: result.toString());
  }

  void append(String action) {
    var appended = '';
    if (state.result == '0') {
      appended = action;
    } else {
      appended = state.result + action;
    }

    state = state.copy(result: appended);
  }
}
