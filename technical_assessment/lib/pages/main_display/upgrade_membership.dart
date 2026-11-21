import 'package:flutter/material.dart';
import 'package:technical_assessment/shared_widgets/upgrade_dialog.dart';

class UpgradeMembershipPage extends StatefulWidget {
  const UpgradeMembershipPage({super.key});

  @override
  State<UpgradeMembershipPage> createState() => _UpgradeMembershipPageState();
}

class _UpgradeMembershipPageState extends State<UpgradeMembershipPage> {

  final CarouselController _carouselController = CarouselController(initialItem: 0);

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselView.weighted(
                  
                  flexWeights: <int>[1],
                  itemSnapping: true,
                  controller: _carouselController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      child: Card(
                        elevation: 0.2,
                        color: Colors.red[700],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Filled Space",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,softWrap: false,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Card(
                        elevation: 0.2,
                        color: Colors.blue[500],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Filled Space 2",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: ElevatedButton(
                onPressed: () => showDialog(context: context, builder: (context)=> UpgradeMembershipDialog()),
                 child: Text("Upgrade Membership")))
          ],
        ),
      ),
    );
  }
}