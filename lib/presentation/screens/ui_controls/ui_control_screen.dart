import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/shared/shared_common_widgets.dart';

class UIControlScreen extends StatelessWidget {
  static const name = "UIControlScreen";
  const UIControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _UIControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  final Map<String, bool> comidaElegidas = {
    "Desyuno": false,
    "Almuerzo": false,
    "Cena": false
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile.adaptive(
            value: isDeveloper,
            title: const Text("Developer Mode"),
            subtitle: const Text("Controles Adicionales"),
            onChanged: (newValue) {
              setState(() {
                isDeveloper = newValue;
              });
            }),
        const SeparatorBetweenWidgets(text: "Transporte"),
        ExpansionTile(
          title: const Text("Vehiculo de Transporte"),
          subtitle: Text(selectedTransportation.name),
          children: [
            ...Transportation.values.map((transport) => RadioListTile.adaptive(
                title: Text("By ${transport.name}"),
                subtitle: Text("Viajar por ${transport.name}"),
                value: transport,
                groupValue: selectedTransportation,
                onChanged: (newTransportation) => setState(() {
                      selectedTransportation = newTransportation!;
                    }))),
          ],
        ),
        const SeparatorBetweenWidgets(text: "Comida"),
        ...comidaElegidas.keys.map(
          (comidas) => CheckboxListTile.adaptive(
              title: Text("Quiere $comidas?"),
              value: comidaElegidas[comidas],
              onChanged: (newValue) => setState(() {
                    comidaElegidas[comidas] = newValue!;
                  })),
        ),
      ],
    );
  }
}
