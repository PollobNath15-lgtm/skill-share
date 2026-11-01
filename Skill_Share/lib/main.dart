import 'package:flutter/material.dart';
import 'package:skill_share/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'auth/auth_gate.dart';

void main() async {
  await Supabase.initialize(
      url: "https://bjnamkkhffvejojevcjf.supabase.co",
      anonKey:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqbmFta2toZmZ2ZWpvamV2Y2pmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk0MzA0OTIsImV4cCI6MjEwNTAwNjQ5Mn0.hxkha_NU54MkFwgeOLfMjLVJCGa7zKL6AzkztzMpXf0");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Share',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home:const AuthGate(),
    );
  }
}