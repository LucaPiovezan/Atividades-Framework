import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import './tela_1.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaLogin(),
    );
  }
}