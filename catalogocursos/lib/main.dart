import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'telaInicial.dart';

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
      title: 'Catálogo de Cursos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: TelaInicial(),
    );
  }
}
