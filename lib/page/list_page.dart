import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool ontap = false;
  List<String> listadewidts = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:
                  listadewidts.map((title) => NewWidget(title: title)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<NewWidget> createState() => _NewWidgeState();
}

class _NewWidgeState extends State<NewWidget> {
  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(
              () {
                ontap = !ontap;
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('fluterando '),
                AnimatedRotation(
                  turns: ontap ? 0.5 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          child: AnimatedAlign(
            heightFactor: ontap ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                FlutterLogo(
                  size: 50,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              ],
            ),
          ),
        )
      ],
    );
  }
}
