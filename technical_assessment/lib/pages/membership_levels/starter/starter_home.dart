import 'package:flutter/material.dart';

class StarterHomeWidget extends StatefulWidget {
  const StarterHomeWidget({super.key});

  @override
  State<StarterHomeWidget> createState() => _StarterHomeWidgetState();
}

class _StarterHomeWidgetState extends State<StarterHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 5,
      children: [
        Card(
          elevation: 0.2,
          color: Colors.grey[700],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filled Space",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0.2,
          color: Colors.blue[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filled Space 2",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0.2,
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filled Space 3",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0.2,
          color: Colors.yellow[500],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filled Space 4",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0.2,
          color: Colors.red[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filled Space 5",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}