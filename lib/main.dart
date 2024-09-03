import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const ColorPickerApp());
}


class ColorPickerApp extends ______ {
  const ColorPickerApp({super.key});

  @override
  Widget build(______) {
    return MaterialApp(
      title: '[put title here]',
      theme: ThemeData(
        primarySwatch: ______,
      ),
      home: ______(),
    );
  }
}
class FavoriteColorsPage extends ______ {
  @override
  _FavoriteColorsPageState ______() => _FavoriteColorsPageState();
}

class _FavoriteColorsPageState extends State<FavoriteColorsPage> {
  List<Color> favoriteColors = [];

  void _addColor(Color color) {
    setState(() {
      favoriteColors.add(color);
    });
  }

  void _showColorPicker(BuildContext context) {
    Color selectedColor = Colors.blue;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                selectedColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                _addColor(selectedColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ______
      body: ______
    );
  }
}