import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'home.dart';

void main() async {
  // Must be first line before any async call
  WidgetsFlutterBinding.ensureInitialized();

  // Load your .env file
  await dotenv.load(fileName: ".env");

  // supabase setup
  await Supabase.initialize(
    url: "https://lkhivehkeckhcfkmuyjp.supabase.co",
    anonKey: dotenv.env['API_Key'] ?? '',
  );


  // print("API_KEY = ${dotenv.env['API_Key']}");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteBook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}