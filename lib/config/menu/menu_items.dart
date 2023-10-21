import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: "Riverpod Counter", subtitle: "Una pantalla con un contador", link: "/counter", icon: Icons.add),
  MenuItem(title: "Botones", subtitle: "Varios Botones en Flutter", link: "/buttons", icon: Icons.smart_button_outlined),
  MenuItem(title: "Tarjetas", subtitle: "Un contenedor estilizado", link: "/cards", icon: Icons.credit_card),
  MenuItem(title: "Progress Indicators", subtitle: "Generales y controlados", link: "/progress", icon: Icons.refresh_rounded),
  MenuItem(title: "Snackbars y dialogos", subtitle: "Indicadores de pantalla", link: "/snackbars", icon: Icons.info_outline_rounded),
  MenuItem(title: "Animated Container", subtitle: "Stateful Widget animado", link: "/animated", icon: Icons.check_box_outline_blank_outlined),
  MenuItem(title: "UI Contrlols + Tiles", subtitle: "Una serie de controles de Flutter", link: "/ui-controls", icon: Icons.car_rental_outlined),
  MenuItem(title: "App Tutorial", subtitle: "Un tutorial muy bonito para nuestra app", link: "/tutorial", icon: Icons.accessibility_new_rounded),
  MenuItem(title: "infinte Scroll y Pull", subtitle: "Listas infinita y tirar para refrescar", link: "/infinite", icon: Icons.loop_sharp),
  MenuItem(title: "Cambiar Tema", subtitle: "Cambiar tema de la aplicacion", link: "/themes", icon: Icons.color_lens_outlined),
];
