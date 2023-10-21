import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final darkModeProvider = StateProvider((ref) => false);

// Listado de colores immutable
final colorListProvider = Provider((ref) => AppTheme.colorList);

final selectedColorSeedProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom). El que controla es ThemeNotifier, la instancia es de AppTheme.
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
