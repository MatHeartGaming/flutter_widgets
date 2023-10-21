import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = "CounterScreen";

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      body: Center(
        child: Text("Valor: 10", style: Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}
