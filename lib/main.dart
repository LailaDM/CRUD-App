import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> cats = ['Misser', 'Miavsen', 'Bullerby', 'Bumle'];
  final textController = TextEditingController();
  int? catIndex;
  IconData buttonIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 148, 102, 226),
        title: Row(
          children: [
            Expanded(
                child: TextField(
              controller: textController,
            )),
            ElevatedButton(
              child: Icon(buttonIcon),
              onPressed: () {
                setState(() {
                  if (catIndex != null) {
                    cats[catIndex!] = textController.text;
                    catIndex = null;
                    buttonIcon = Icons.add;
                  } else {
                    cats.add(textController.text);
                  }
                  textController.clear();
                });
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(cats[index]),
              onTap: () {
                catIndex = index;
                setState(() {
                  textController.text = cats[index];
                  buttonIcon = Icons.save;
                });
              },
              onLongPress: () {
                setState(
                  () {
                    cats.removeAt(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
