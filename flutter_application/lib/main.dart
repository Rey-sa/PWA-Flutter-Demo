import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

void main() {
  runApp(const MyApp());
  var apiClient = ApiClient(basePath: 'http://localhost:8080');
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

void _onButtonClicked(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Button clicked!"),
        duration: Duration(seconds: 2), // Toast duration
      ),
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Icon(Icons.menu),
        
      ),

      body: Stack(
      children: [
        Image.asset(
          'assets/img/palms.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Ask me anything!'),
            Padding(
              padding: EdgeInsets.all(16.0),

              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.4),
                  labelText: 'Your input'
                ),
              ), 
            ),

          ElevatedButton(
          onPressed: () => _onButtonClicked(context),
          child: const Text("Send"),
          ),

            Padding(padding: const EdgeInsets.all(16.0),
            child: Text(
              'Chats answer'
              ),
            )
          ],
        ),
      ],
      ),
    );
  }
}
