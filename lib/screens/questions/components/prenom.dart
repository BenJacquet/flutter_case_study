import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/age.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prenom extends StatefulWidget {
  const Prenom({super.key});
  @override
  PrenomState createState() => PrenomState();
}

class PrenomState extends State<Prenom> {

  Future<void> _setPrenom() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('prenom', textController.text);
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
                "Commençons par ton prénom",
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
                _setPrenom();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Age())
                );
              },
            ),
            const Spacer(flex: 4),
            const Spacer(flex: 4),
          ]
      ),
    );
  }
}