import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/shared/shared_common_widgets.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "ProgressScreen";
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Circular Progress Indicator"),
          SizedBox(
            height: 10,
          ),

          //Standard Circular Progress
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),

          SeparatorBetweenWidgets(text: "Progress Indicator Circular y Linear Controlado"),
          _ControlledProgressIndicator(),

          SeparatorBetweenWidgets(text: "Progress Indicator Adaptivo en base al SO"),
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2).toDouble() / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                )),
              ],
            ),
          );
        });
  }
}
