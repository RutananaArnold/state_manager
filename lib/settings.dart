import 'package:flutter/material.dart';
import 'package:state_manager/model/ui.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // double _value = 0.5;
  // int getFontSize() => (_value * 30).toInt();

 
 
  @override
  Widget build(BuildContext context) {
     // if you want to change just a single widget on the screen
    //  final uiProv = Provider.of<UI>(context, listen: false);
     
    return Consumer<UI>(
      builder: (context, ui, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Font Size: ${ui.fontSize}'),
            Slider(
                min: 0.5,
                divisions: 10,
                value: ui.sliderFontSize,
                onChanged: (value) {
                  setState(() {
                    ui.fontSize = value;
                  });
                })
          ],
        );
      },
    );
  }
}
