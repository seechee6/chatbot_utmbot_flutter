import 'package:flutter/material.dart';
import 'package:flutter_application_10/function.dart';
import 'package:flutter_application_10/main.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatMessage> messages = [ChatMessage(content: 'Bot: Hello! How can i assist you today?', isUser: false)]; 

  void _sendMessage(String message) {
    setState(() {
      messages.add(ChatMessage(content: 'You: $message', isUser: true));
    });

    fetchdata('http://10.0.2.2:5000/api?query=$message').then((data) {
      setState(() {
        messages.add(ChatMessage(content: 'Bot: $data', isUser: false));
      });
    });
      _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/botpp.png',),),
            SizedBox(width: 20,),
            Text('UTMbot',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,),),
          ],
        ),
        backgroundColor: Colors.red[200],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const MyApp();
              })));
            },
            icon:const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.red[50]),
            child: Row(
              children: [
                Padding(
                  padding:const EdgeInsets.only(left: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 320,
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your query ',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      _sendMessage(_messageController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String content;
  final bool isUser;

  ChatMessage({required this.content, required this.isUser});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: message.isUser ? Colors.red[100] : Colors.grey[300],
      
      ),
      child: Text(
        message.content,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
