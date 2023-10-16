import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Popup Menu Demo'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
            PopupMenuButton(
              itemBuilder: ((context) => [
                    PopupMenuItem(value: 1, child: Text('Setting')),
                    PopupMenuItem(value: 2, child: Text('Privacy')),
                    PopupMenuItem(value: 3, child: Text('Logout')),
                  ]
              
                  ),
              onSelected: ((value) {
                if(value ==1 ){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                  Text('You Choose Setting'),
                  duration: Duration(microseconds: 1300)),
              );}
              }),    
            )

          ],
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 1"),
          color: Colors.orange[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 2"),
          color: Colors.green[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 3"),
          color: Colors.red[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 4"),
          color: Colors.purple[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 5"),
          color: Colors.blueGrey[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          child: const Text("Tile 6"),
          color: Colors.yellow[200],
        ),
      ],
    ));
  }
}
