import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const ColorPickerApp());
}


class ColorPickerApp extends StatelessWidget {
  const ColorPickerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Colors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FavoriteColorsPage(),
    );
  }
}
class FavoriteColorsPage extends StatefulWidget {
  @override
  _FavoriteColorsPageState createState() => _FavoriteColorsPageState();
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
      appBar: AppBar(
        title: Text('Favorite Colors'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _showColorPicker(context),
            child: Text('Add a Favorite Color'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteColors.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: favoriteColors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}