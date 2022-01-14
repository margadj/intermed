import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            // do something
          },
        ),
        title: const Text('Тусламж үйлчилгээ',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfff0f8fe),
        elevation: 0,
      ),
      body: Center(),
    ));
  }
}
