import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions:[
          TextButton(
              onPressed: () {
              //
              },
              child: const Text("Suivant")),
        ],
      ),
      body: Stack(),
    );
  }
}