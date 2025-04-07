import 'package:flutter/material.dart';
import 'package:flutter_application/homepage.dart';
import 'package:openapi/api.dart';
import 'package:provider/provider.dart';

void main() {
    var apiClient = ApiClient(basePath: 'http://localhost:8080');
    var api = ChatApi(apiClient);
  runApp(
    Provider<ChatApi>(
      create: (_) => api,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chad 1.0',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const MyHomePage(title: 'Chad 1.0'),
    );
  }
}

