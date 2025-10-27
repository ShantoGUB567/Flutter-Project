import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'theme.dart';

class ToggleActivity extends StatelessWidget {
  const ToggleActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        bool isLight = themeProvider.themeData == lightMode;

        return GestureDetector(
          onTap: () {
            themeProvider.toggleTheme(); // theme change
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween<double>(begin: 0.75, end: 1.0).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              isLight ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isLight ? 'light' : 'dark'),
              color: isLight ? Colors.orange : Colors.white,
              size: 28,
            ),
          ),
        );
      },
    );
  }
}
