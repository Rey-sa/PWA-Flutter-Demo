import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  ChatApi? _api;
  var _aiAnswer = "";

  void _askAI() async{
    final userInput = _textController.text;
    var message = Message(
      timestamp: DateTime.now().toUtc(),
      message: userInput,
      author: MessageAuthorEnum.user,
    );

    if(userInput.isEmpty) return;

    var response = await _api!.chat(message);

    _setAiAnswer(response!);
  }


  void _setAiAnswer(Message message) {
    setState(() {
      _aiAnswer = message.message ?? "<no message received>";
    });
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
                key:  const Key('UserInputTextField'),
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.4),
                  labelText: 'Enter your question here'
                ),
              ), 
            ),

          ElevatedButton(
          onPressed: _askAI,
          child: Icon(Icons.send),
          ),

          Visibility( 
          visible: _aiAnswer.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              key: const Key('ChadAnswer'),
              controller: TextEditingController(text: _aiAnswer),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.4),
                labelText: 'Chads answer'
              ),
              readOnly: true,
            ),
          ))
          ],
        ),
      ],
      ),
    );
  }
}
