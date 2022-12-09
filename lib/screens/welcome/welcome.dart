import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/prenom.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 4),
          Text(
            "Bienvenue !",
            style: Theme.of(context).textTheme.headline3?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
          ElevatedButton(
            child:  const Text("Faisons connaissance !",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Prenom())
              );
              },
          ),
          const Spacer(flex: 4),
        ],
      )
    );
  }
}