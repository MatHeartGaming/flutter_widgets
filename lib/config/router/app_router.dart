import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: CardsScreen.name,
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    name: ButtonsScreen.name,
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    name: ProgressScreen.name,
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    name: SnackbarScreen.name,
    path: '/snackbars',
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    name: AnimatedScreen.name,
    path: '/animated',
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    name: UIControlScreen.name,
    path: '/ui-controls',
    builder: (context, state) => const UIControlScreen(),
  ),
  GoRoute(
    name: AppTutorialScreen.name,
    path: '/tutorial',
    builder: (context, state) => const AppTutorialScreen(),
  ),
  GoRoute(
    name: InfinteScrollScreen.name,
    path: '/infinite',
    builder: (context, state) => const InfinteScrollScreen(),
  ),
  GoRoute(
    name: CounterScreen.name,
    path: '/counter',
    builder: (context, state) => const CounterScreen(),
  ),
  GoRoute(
    name: ThemeChangerScreen.name,
    path: '/themes',
    builder: (context, state) => const ThemeChangerScreen(),
  ),
]);
