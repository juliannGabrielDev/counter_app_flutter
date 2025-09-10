import 'package:counter_app_flutter/presentation/screens/counter/counter_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.lightGreen,
  );
  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.lightGreen,
    brightness: Brightness.dark,
  );

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