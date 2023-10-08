import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/buttons/custom_buttons.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            // Elevated Buttons

            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text("Elevated Button Disabled"),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("Elevated Button Icons"),
            ),

            // Filled Buttons

            FilledButton(onPressed: () {}, child: const Text("Filled Button")),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_sharp),
                label: const Text("Filled Icon")),
            FilledButton.tonal(
                onPressed: () {}, child: const Text("Filled Btn Tonal")),

            // Outlined Buttons

            OutlinedButton(
                onPressed: () {}, child: const Text("Outline Buttons")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new_rounded),
                label: const Text("Outlined Icon")),

            // Icon Button

            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white))
              ),


              // Custom Buttons
              const CustomButton(),

          ],
        ),
      ),
    );
  }
}


