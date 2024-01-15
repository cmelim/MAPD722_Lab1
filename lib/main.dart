import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double boxWidth = 200.0;
  double boxHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Resizable Box
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  boxWidth += details.primaryDelta!;
                  boxHeight += details.primaryDelta!;
                });
              },
              child: Container(
                width: boxWidth,
                height: boxHeight,
                color: Colors.blue,
                child: const Center(
                  child: Text('Resize Me'),
                ),
              ),
            ),
            // Reorderable List
            ReorderableListView(
              children: const [
                ListTile(
                  key: Key('1'),
                  title: Text('Item 1'),
                ),
                ListTile(
                  key: Key('2'),
                  title: Text('Item 2'),
                ),
                ListTile(
                  key: Key('3'),
                  title: Text('Item 3'),
                ),
              ],
              onReorder: (oldIndex, newIndex) {
                // Implement reorder logic here
                // You may need to manage a list of items and update their order
              },
            ),
            // Split View
            Container(
              width: 1.0,
              height: double.infinity,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

