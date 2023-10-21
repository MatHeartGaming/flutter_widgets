import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final darkModeProvider = StateProvider((ref) => false);

// Listado de colores immutable
final colorListProvider = StateProvider((ref) => AppTheme.colorList);

final selectedColorSeedProvider = StateProvider((ref) => 0);
