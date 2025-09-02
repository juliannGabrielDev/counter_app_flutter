import 'package:counter_app_flutter/presentation/screens/counter/counter_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  // En la función main colocamos la ejecución de un widget
  runApp(const MyApp());
}

/// A simple Flutter app that displays 'Hello World'.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
  );
  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.grey,
    brightness: Brightness.dark,
  );

  // El key permite identificar un widget
  // Los widgets deben tener un Widget build
  // BuildContext genera el árbol de widgets
  @override
  Widget build(BuildContext context) => DynamicColorBuilder(
    builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) =>
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightDynamic ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          home: const CounterScreen(),
        ),
  );
}