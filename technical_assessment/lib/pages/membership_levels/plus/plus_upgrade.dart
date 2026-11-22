import 'package:material_ui/material_ui.dart';

import '../../../data/data_classes.dart';
import '../../../data/services.dart';
import '../../../shared_widgets/upgrade_dialog.dart';

class PlusUpgradeWidget extends StatefulWidget {
  const PlusUpgradeWidget({super.key,required this.membershipId});
  final String? membershipId;
  @override
  State<PlusUpgradeWidget> createState() => _PlusUpgradeWidgetState();
}

class _PlusUpgradeWidgetState extends State<PlusUpgradeWidget> {
   final CarouselController _carouselController = CarouselController(initialItem: 0);
   bool busy = false;
  late final List<Membership> _membershipList;
  late final List<Features> featuresList;
  late final Membership chosenMembership;
  String? membershipId;

  Future<void> getUpgradeOptions() async{
    busy = true;
      _membershipList = await DataServices().getMembershipList();
      chosenMembership = _membershipList.where((x) => x.id == 'premium').first;
      
     setState(() {
      membershipId = widget.membershipId;
     });
    busy = false;
  }

  @override
  void initState() {
    getUpgradeOptions();
    super.initState();
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return busy? 
      CircularProgressIndicator():
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0.2,
              color: Colors.red,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(chosenMembership.name,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,softWrap: false,)
                  ],
                ),
              ),
            )
          ),
        ),
        Expanded(
          flex: 0,
          child: ElevatedButton(
            onPressed: () {
              showDialog(context: context, 
                builder: (context)=> UpgradeMembershipDialog(membershipId: membershipId,newMembership: chosenMembership.name));
            },
             child: Text("Upgrade Membership")))
      ],
    );
  }
}