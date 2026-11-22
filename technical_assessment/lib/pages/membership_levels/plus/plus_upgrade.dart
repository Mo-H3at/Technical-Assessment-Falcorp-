import 'package:flutter/material.dart';

import '../../../shared_widgets/upgrade_dialog.dart';

class PlusUpgradeWidget extends StatefulWidget {
  const PlusUpgradeWidget({super.key});

  @override
  State<PlusUpgradeWidget> createState() => _PlusUpgradeWidgetState();
}

class _PlusUpgradeWidgetState extends State<PlusUpgradeWidget> {
   final CarouselController _carouselController = CarouselController(initialItem: 0);
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
                    color: const Color.fromARGB(255, 113, 211, 47),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Upgrade to Premium",
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center,softWrap: false,),
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
    );
  }
}