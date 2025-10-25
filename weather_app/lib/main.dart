import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  // ensure binding
  WidgetsFlutterBinding.ensureInitialized();

  // load .env file
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeActivity(),
    );
  }
}
