import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/aliment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Age extends StatefulWidget {
  const Age({super.key});
  @override
  AgeState createState() => AgeState();
}

class AgeState extends State<Age> {

  Future<void> _setAge() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('age', textController.text);
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
              "Quel âge as-tu ?",
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
                _setAge();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Aliment())
                );
              },
            ),
            const Spacer(flex: 4),
          ]
      ),
    );
  }
}