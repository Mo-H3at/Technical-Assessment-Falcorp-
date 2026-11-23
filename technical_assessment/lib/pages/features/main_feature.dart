import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/data_classes.dart';

class MainFeaturePage extends StatefulWidget {
  const MainFeaturePage({super.key, this.feature});
  final feature;
  @override
  State<MainFeaturePage> createState() => _MainFeaturePageState();
}

class _MainFeaturePageState extends State<MainFeaturePage> {

  bool busy = false;
  var feature;

  void setFeature()async{
  busy = true;
  await Future.delayed(const Duration(seconds: 1));
  feature = widget.feature;
  setState(() {});
  busy = false;
}

@override
  void initState() {
    setFeature();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
        
      ),
      body: Center(
        child: busy ? 
        CircularProgressIndicator() : 
        Card(
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('This is a placeholder for the feature selected: ${feature['name']}', style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}