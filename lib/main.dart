import 'package:flutter/material.dart';
import 'package:flutter_application/ui/home_page.dart';
import 'package:flutter_application/ui/theme.dart';

void main() {
  runApp(FlutterCepApp());
}

class FlutterCepApp extends StatelessWidget {
  const FlutterCepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search CEP',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}
