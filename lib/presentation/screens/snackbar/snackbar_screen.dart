import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/constants/contansts.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "SnackbarScreen";
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      const SnackBar(
        content: Text("Hola Mundo!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbars y dialogos")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    children: [
                      const Text(
                          "Una app para mostrar los Widgets the Flutter 😊"),
                    ],
                  );
                },
                child: const Text("Licensias usadas")),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text("Mostrar Dialogo")),
          ],
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: const Text("Estas seguro?"),
              content: const Text(dialogMockText),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("Cancelar"),
                ),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text("Aceptar"))
              ],
            ));
  }
}
