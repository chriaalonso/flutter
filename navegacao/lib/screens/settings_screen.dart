import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String Subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(Subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glútem',
                    'Apenas refeições sem glútem',
                    settings!.isGlutenFree,
                    (value) => setState(() => settings!.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Apenas refeições sem lactose',
                    settings!.isLactoseFree,
                    (value) => setState(() => settings!.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Apenas refeições Veganas',
                    settings!.isVegan,
                    (value) => setState(() => settings!.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Apenas refeições Vegetarianas',
                    settings!.isVegetarian,
                    (value) => setState(() => settings!.isVegetarian = value),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
