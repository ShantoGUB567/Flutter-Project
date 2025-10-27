import 'package:flutter/material.dart';
import 'package:login_ui/login.dart';
import 'package:login_ui/theme.dart';
import 'package:login_ui/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Log-In",
      debugShowCheckedModeBanner: false,
      home: const Login_Activity(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
