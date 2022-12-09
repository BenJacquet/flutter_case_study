import 'package:flutter/material.dart';
import 'package:introduction/screens/summary/summary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Heros extends StatefulWidget {
  const Heros({super.key});
  @override
  HerosState createState() => HerosState();
}

class HerosState extends State<Heros> {

  Future<void> _setHeros() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('heros', textController.text);
    });
  }

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            const Spacer(flex: 4),
            Text(
              "Quel est ton super-héros préféré ?",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Écris le ici',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              child:  const Text("Suivant !",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _setHeros();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Summary())
                );
              },
            ),
            const Spacer(flex: 4),
          ]
      ),
    );
  }
}