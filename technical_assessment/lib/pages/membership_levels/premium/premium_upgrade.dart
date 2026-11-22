import 'package:material_ui/material_ui.dart';

class PremiumUpgradeWidget extends StatefulWidget {
  const PremiumUpgradeWidget({super.key});
  

  @override
  State<PremiumUpgradeWidget> createState() => _PremiumUpgradeWidgetState();
}

class _PremiumUpgradeWidgetState extends State<PremiumUpgradeWidget> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 0.2,
      color: Colors.red[700],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is the Highest tier of your member and thus has no upgrade option",
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,softWrap: false,),
          ],
        ),
      ),
    );
  }
}