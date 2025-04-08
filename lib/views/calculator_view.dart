import 'package:flutter/material.dart';
import '../widgets/calc_button.dart';
import '../controllers/calculator_controller.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController _controller = CalculatorController();

  void _onPressed(String value) {
    setState(() {
      _controller.input(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Web')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Text(
                _controller.display,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          Wrap(
            children: [
              for (var val in ['7', '8', '9', '/', '4', '5', '6', '*', '1', '2', '3', '-', '0', '.', '=', '+'])
                CalcButton(label: val, onTap: () => _onPressed(val)),
              CalcButton(label: 'C', onTap: () => setState(() => _controller.clear())),
            ],
          )
        ],
      ),
    );
  }
}
