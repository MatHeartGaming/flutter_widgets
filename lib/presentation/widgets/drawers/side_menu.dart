import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<MenuItem> menuItems;

  const SideMenu(
      {super.key, this.menuItems = const [], required this.scaffoldKey})
      : assert(menuItems.length > 3);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // To Check for notch presence
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (newIndex) {
          setState(() {
            navDrawerIndex = newIndex;
          });
          MenuItem menuItem = widget.menuItems[newIndex];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...widget.menuItems
              .sublist(0, 3)
              .map((item) => NavigationDrawerDestination(
                    icon: Icon(item.icon),
                    label: Text(item.title),
                  )),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 18, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "More options",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Divider(),
              ],
            ),
          ),
          ...widget.menuItems
              .sublist(3)
              .map((item) => NavigationDrawerDestination(
                    icon: Icon(item.icon),
                    label: Text(item.title),
                  )),
        ]);
  }
}
