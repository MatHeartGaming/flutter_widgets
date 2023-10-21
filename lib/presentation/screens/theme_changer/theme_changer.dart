import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "ThemeChangerScreen";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
              onPressed: () {
                bool isDarkMode = ref.read(darkModeProvider.notifier).state;
                ref.watch(darkModeProvider.notifier).state = !isDarkMode;
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined)),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Color> colors = ref.watch(colorListProvider);
    int selectedcColorIndex = ref.watch(selectedColorSeedProvider);
    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile.adaptive(
              title: const Text(
                "Este color",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              subtitle: Text("${color.value}"),
              activeColor: color.withAlpha(100),
              tileColor: color,
              value: index,
              groupValue: selectedcColorIndex,
              onChanged: (newIndex) => ref.read(selectedColorSeedProvider.notifier)
                          .state = newIndex!,
              

              
            );
        });
  }
}
