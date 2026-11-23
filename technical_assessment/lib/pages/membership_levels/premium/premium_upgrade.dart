import 'package:material_ui/material_ui.dart';

class PremiumUpgradeWidget extends StatefulWidget {
  const PremiumUpgradeWidget({super.key});
  

  @override
  State<PremiumUpgradeWidget> createState() => _PremiumUpgradeWidgetState();
}

class _PremiumUpgradeWidgetState extends State<PremiumUpgradeWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 0.2,
      color: const Color.fromARGB(255, 35, 255, 23),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This is the Highest tier of your member and thus has no upgrade option",
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center),
            ),
            Text("Enjoy your membership",
              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}