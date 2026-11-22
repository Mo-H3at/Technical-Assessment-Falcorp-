import 'package:flutter/material.dart';

import '../../../shared_widgets/upgrade_dialog.dart';

class StarterUpgradeWidget extends StatefulWidget {
  const StarterUpgradeWidget({super.key});
  
  @override
  State<StarterUpgradeWidget> createState() => _StarterUpgradeWidgetState();
}

class _StarterUpgradeWidgetState extends State<StarterUpgradeWidget> {
  final CarouselController _carouselController = CarouselController(initialItem: 0);

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          Text("Upgrade to Plus",
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center,softWrap: false,),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0.2,
                  color: const Color.fromARGB(255, 103, 243, 33),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Upgrade to Premuim",
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,softWrap: false,)
                      ],
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
    );
  }
}