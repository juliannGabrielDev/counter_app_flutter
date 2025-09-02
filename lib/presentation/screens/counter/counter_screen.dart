import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

/// A screen that displays a counter with
/// increment, decrement, and reset functionality.
class CounterScreen extends StatefulWidget {
  /// Creates a [CounterScreen] widget.
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _clickCounter = 0;

  void _incrementCounter() {
    setState(() {
      _clickCounter++;
    });
    SystemSound.play(SystemSoundType.click);
    HapticFeedback.lightImpact();
  }

  void _decrementCounter() {
    setState(() {
      _clickCounter--;
    });
    SystemSound.play(SystemSoundType.click);
  }

  void _resetCounter() {
    setState(() {
      _clickCounter = 0;
    });
    SystemSound.play(SystemSoundType.click);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Counter', style: GoogleFonts.anton()),
      actions: [
        if (_clickCounter != 0)
          IconButton(
            onPressed: _resetCounter,
            icon: const Icon(Icons.refresh_rounded),
          ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _incrementCounter,
            child: Text(
              '$_clickCounter',
              style: GoogleFonts.anton(
                fontSize: 140,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            'click${(_clickCounter != 1) ? 's' : ''}',
            style: GoogleFonts.poppins(fontSize: 20),
          ),
        ],
      ),
    ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_clickCounter != 0)
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: _decrementCounter,
          ),
        if (_clickCounter != 0) const SizedBox(height: 16),
        CustomButton(
          icon: Icons.add,
          onPressed: _incrementCounter,
          size: ButtonSize.large,
        ),
      ],
    ),
  );
}

/// An enum to define the available button sizes.
enum ButtonSize {
  /// A small button.
  small,

  /// A regular-sized button.
  regular,

  /// A large button.
  large,
}

/// A custom floating action button with an icon and press callback.
class CustomButton extends StatelessWidget {
  /// Creates a [CustomButton] widget.
  const CustomButton({
    required this.icon,
    required this.onPressed,
    this.size = ButtonSize.regular,
    super.key,
  });

  /// The icon to display inside the button.
  final IconData icon;

  /// The callback that is called when the button is pressed.
  final VoidCallback onPressed;

  /// The size of the button.
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    switch (size) {
      case ButtonSize.small:
        return FloatingActionButton.small(
          onPressed: onPressed,
          child: Icon(icon),
        );
      case ButtonSize.large:
        return FloatingActionButton.large(
          onPressed: onPressed,
          child: Icon(icon),
        );
      case ButtonSize.regular:
        return FloatingActionButton(onPressed: onPressed, child: Icon(icon));
    }
  }
}