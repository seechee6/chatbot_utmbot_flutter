import 'package:flutter/material.dart';
import 'package:flutter_application_10/chatbot.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: Center(
                child: Text(
                  'Hi There,\nI\'m UTMbot',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[950],
                  ),
                ),
              ),
            ),
            Image.asset("assets/redbot.png", width: 180, height: 180),
            Text(
              "\"Ask me your queries about University Technology Malaysia\"",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[950],
                  fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                    backgroundColor: Colors.redAccent[700]),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ChatBot();
                  }));
                },
                child: const Text(
                  "Let's get started",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
