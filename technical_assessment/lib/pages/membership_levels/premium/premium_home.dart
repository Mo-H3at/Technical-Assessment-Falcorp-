import 'package:flutter/material.dart';

class PremiumHomeWidget extends StatefulWidget {
  const PremiumHomeWidget({super.key});

  @override
  State<PremiumHomeWidget> createState() => _PremiumHomeWidgetState();
}

class _PremiumHomeWidgetState extends State<PremiumHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 5,
      children: [
        Card(
          elevation: 0.2,
          color: const Color.fromARGB(255, 249, 2, 2),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Plus Space",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0.2,
          color: const Color.fromARGB(255, 199, 251, 187),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Plus Space 2",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}