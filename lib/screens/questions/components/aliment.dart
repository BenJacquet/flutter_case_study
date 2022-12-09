import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/super_heros.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Aliment extends StatefulWidget {
  const Aliment({super.key});
  @override
  AlimentState createState() => AlimentState();
}

class AlimentState extends State<Aliment> {

  Future<void> _setAliment() async {
    final prefs = await SharedPreferences.getInstance();
      setState(() {
      prefs.setString('aliment', textController.text);
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
              "Quel est ton aliment préféré ?",
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
                _setAliment();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Heros())
                );
              },
            ),
            const Spacer(flex: 4),
          ]
      ),
    );
  }
}