import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
    generateColors();
  }

  void generateColors() {
    // Clear existing colors
    colors.clear();

    // Generate a random base color
    final Random random = Random();
    Color baseColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );

    // Convert baseColor to HSLColor to get hue
    HSLColor hslBaseColor = HSLColor.fromColor(baseColor);

    // Generate complementary colors
    colors.add(baseColor);
    for (int i = 0; i < 4; i++) {
      double hue =
          (hslBaseColor.hue + 180 + (random.nextDouble() * 60 - 30)) % 360;
      colors.add(HSLColor.fromAHSL(1.0, hue, 0.5, 0.5).toColor());
    }

    // Update UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  colors.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: colors[index],
                    margin: const EdgeInsets.all(10),
                  ),
                ),
              ),
              //const SizedBox(height: 20),
              ElevatedButton(
                onPressed: generateColors,
                child: const Text('Generate New Palette'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
