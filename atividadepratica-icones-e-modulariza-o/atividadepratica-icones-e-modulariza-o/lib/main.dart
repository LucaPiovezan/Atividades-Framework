import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/tela_home.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Ícones',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,   
      locale: DevicePreview.locale(context),  
      builder: DevicePreview.appBuilder,     
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFF0F0C08),
        cardColor: Color(0xFF1A1410),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0F0C08),
          foregroundColor: Color(0xFFD4A853),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFD4A853),
            foregroundColor: Color(0xFF0F0C08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: TelaHome(),
    );
  }
}