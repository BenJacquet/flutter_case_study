import 'package:flutter/material.dart';
import 'package:introduction/screens/questions/components/prenom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary>{

  bool _isLoading = true;
  String _prenom = '';
  String _aliment = '';
  String _heros = '';
  String _age = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _prenom = prefs.getString('prenom') ?? 'Inconnu';
    _aliment = prefs.getString('aliment') ?? 'Inconnu';
    _heros = prefs.getString('heros') ?? 'Inconnu';
    _age = prefs.getString('age') ?? 'Inconnu';
    _isLoading = false;
    if (mounted) setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading
      ? const Center(child: CircularProgressIndicator())
      : Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 4),
          Text(
            "Récapitulons, $_prenom\n\n"
            "Tu as $_age ans\n\n"
            "Si tu pouvais tu te nourrirais seulement de $_aliment !\n\n"
            "Tu es fan de $_heros !\n",
            style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
          Text(
            "On a tout bon ?",
            style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  child:  const Text("Non !",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Prenom())
                    );
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  child:  const Text("Exact !",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                const Spacer(),
              ],
            ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}