import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/prenom.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
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
                          MaterialPageRoute(builder: (context) => Prenom())
                        );
                      },
                  ),
                  const Spacer(flex: 4),
                ],
              )
          )
        ],
      )
    );
  }
}