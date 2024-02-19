import 'package:flutter/material.dart';
import 'package:web_shop/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pu Heng',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black54,
          selectionColor: Colors.cyan.withAlpha(100),
        ),
      ),
      home: const HomePage(title: 'Pu Heng Shop'),
    );
  }
}
