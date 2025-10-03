import 'package:flutter/material.dart';

void main() {
  runApp(IvanaApp());
}

class IvanaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ivana App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Back to Friend",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 51, 28, 84),
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 169, 201, 240),
          centerTitle: true,
          foregroundColor: const Color.fromARGB(255, 164, 138, 211),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 153, 195, 241),
                const Color.fromARGB(255, 1, 86, 166)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //untuk scrollable
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16), // supaya ada jarak tepi
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //rata kanan
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Song by Sombr",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 177, 224, 255),
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Touch my body tender\n"
                  "'Cause the feeling makes me weak\n"
                  "Kicking off the covers\n"
                  "I see the ceiling, while you're looking down at me\n\n"
                  "How can we go back to being friends\n"
                  "When we just shared a bed?\n"
                  "How can you look at me and pretend\n"
                  "I'm someone you've never met?\n\n"
                  "It was last December\n"
                  "You were layin' on my chest\n"
                  "I still remember\n"
                  "I was scared to take a breath, didn't want you to move your head\n\n"
                  "How can we go back to being friends\n"
                  "When we just shared a bed? (Yeah)\n"
                  "How can you look at me and pretend\n"
                  "I'm someone you've never met?\n\n"
                  "The devil in your eyes\n"
                  "Won't deny the lies\n"
                  "You've sold, I'm holding on too tight\n"
                  "While you let go, this is casual\n\n"
                  "How can we go back to being friends\n"
                  "When we just shared a bed? (Yeah)\n"
                  "How can you look at me and pretend\n"
                  "I'm someone you've never met?\n\n"
                  "How can we go back to being friends\n"
                  "When we just shared a bed? (Yeah)\n"
                  "How can you look at me and pretend\n"
                  "I'm someone you've never met?\n\n"
                  "I'm someone you've never met\n"
                  "Oh yeah",
                  textAlign: TextAlign.center, // 👈 tambahan
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
