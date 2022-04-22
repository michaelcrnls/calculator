class CalculatorState {
  String result;
  final String? lastAction;
  CalculatorState({
    this.result = '0',
    this.lastAction,
  });

  CalculatorState copy({
    String? result,
    String? lastAction,
  }) =>
      CalculatorState(
        result: result ?? this.result,
        lastAction: lastAction ?? this.lastAction,
      );
}
