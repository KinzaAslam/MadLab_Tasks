//Main.dart

import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';

class CustomColors {
  static const Color myCustomColor = Color(0xFF142645);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

//Home.dart

import 'package:flutter/material.dart';
import 'chat.dart';

class CustomColors {
  static const Color myCustomColor = Color(0xFF142645);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.myCustomColor,
        title: const Text(
          'Messenger',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          // (video call)
          const Icon(Icons.camera),
          const SizedBox(width: 30),
          // (audio call)
          const Icon(Icons.search),
          const SizedBox(width: 30),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Option 1'),
              ),
              const PopupMenuItem(
                child: Text('Option 2'),
              ),
              const PopupMenuItem(
                child: Text('Option 3'),
              ),
            ],
          ),
          const SizedBox(width: 100),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: const Text('Aisha'),
              subtitle: const Text(
                  "Isha, Muhnjo paper sutho nahe thio mukhy tips de😪😪"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img3.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Areesha'),
              subtitle: const Text("Aj mukhy uni mai safa mazo kon ayo!!😣😏"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img1.jpg')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Kinza'),
              subtitle: const Text(
                  "Yar Isha, mujh ye wala task phirse bhejo mere  pass run nh hurha "),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img2.jpg')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Kubra'),
              subtitle:
                  const Text("Marhon je parwah na kar ishaaaaaaaaaaaaaaaa!"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img4.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Fahad'),
              subtitle: const Text("Tar hita!......."),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img5.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Amiii'),
              subtitle: const Text("😂😀🤩🤗"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img6.jpg')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Amber'),
              subtitle: const Text("Thankyooowwwwwwwww Ishhaaa"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img7.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Muntaha'),
              subtitle: const Text("Achhhh, point bethi a chori!!"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img8.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('MUET SW'),
              subtitle: const Text(
                  "Isn't it funny and cool how everyone's working so hard to show off their 'impressive' qualities? which even doesn't exist in real-life"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/img9.png')),
              trailing: const Icon(Icons.camera_alt_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyChat()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Chat.dart

import 'package:flutter/material.dart';
import 'home.dart';

class CustomColors {
  static const Color myCustomColor = Color(0xFF142645);
}

class MyChat extends StatefulWidget {
  const MyChat({super.key});

  @override
  State<MyChat> createState() => MyChatState();
}

class MyChatState extends State<MyChat> {
  TextEditingController textEditingController = TextEditingController();
  String sentMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.myCustomColor,
        title: const Text(
          'Chat App',
          style: TextStyle(color: Colors.white),
        ),
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              ),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            // First icon
            const SizedBox(width: 8), 
            const Icon(Icons.person), 
          ],
        ),
        actions: [
          // Third icon (video call)
          const Icon(Icons.video_call),
          const SizedBox(width: 30),
          // Fourth icon (audio call)
          const Icon(Icons.call),
          const SizedBox(width: 30),

          // Dots menu (three dots)
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Option 1'),
              ),
              const PopupMenuItem(
                child: Text('Option 2'),
              ),
              const PopupMenuItem(
                child: Text('Option 3'),
              ),
            ],
          ),
          const SizedBox(width: 100),
        ],

        iconTheme: const IconThemeData(
            color: Colors.white), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: [
            const SizedBox(height: 16), 
            Text(sentMessage), 
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Write message ...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    
                    String message = textEditingController.text;
                    setState(() {
                      sentMessage = message; 
                    });
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
