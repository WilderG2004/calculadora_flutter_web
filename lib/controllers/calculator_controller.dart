class CalculatorController {
  String _input = '';
  String _display = '';

  String get display => _display.isEmpty ? '0' : _display;

  void input(String value) {
    if (value == '=') {
      try {
        final result = _evaluate(_input);
        _display = result.toString();
        _input = result.toString();
      } catch (_) {
        _display = 'Error';
        _input = '';
      }
    } else {
      _input += value;
      _display = _input;
    }
  }

  void clear() {
    _input = '';
    _display = '';
  }

  double _evaluate(String expr) {
    // Muy básico: usar eval segura en prod
    return double.parse(
        Function.apply(const ExpressionEvaluator(), [expr]) as String);
  }
}

// Evaluador básico con seguridad limitada
class ExpressionEvaluator {
  const ExpressionEvaluator();

  String call(String expr) {
    // Esta es solo una simulación, se puede mejorar con un parser real
    try {
      final parsed = expr.replaceAll('×', '*').replaceAll('÷', '/');
      final result = double.parse(eval(parsed).toStringAsFixed(2));
      return result.toString();
    } catch (_) {
      return '0';
    }
  }

  double eval(String expr) {
    // NO USAR EN PRODUCCIÓN: solo para prueba
    return double.parse(expr.replaceAll(RegExp(r'[^0-9\.\+\-\*/]'), ''));
  }
}
