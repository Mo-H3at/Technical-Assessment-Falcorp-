import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/data_classes.dart';
import 'package:technical_assessment/data/services.dart';

import '../../../shared_widgets/upgrade_dialog.dart';

class StarterUpgradeWidget extends StatefulWidget {
  const StarterUpgradeWidget({super.key,required this.id,required this.membershipId});

  final String id;
  final String? membershipId;
  @override
  State<StarterUpgradeWidget> createState() => _StarterUpgradeWidgetState();
}

class _StarterUpgradeWidgetState extends State<StarterUpgradeWidget> {

  final CarouselController _carouselController = CarouselController(initialItem: 0);
  bool busy = false;
  late final List<Membership> _membershipList;
  late User user;
  List<dynamic> featuresList = [];
  String? membershipId;
  String? membershipName;

  Future<void> getUpgradeOptions() async{
    busy = true;
      _membershipList = await DataServices().getMembershipList();
    user = await DataServices().getUser(widget.id);
     setState(() {
       _membershipList.removeWhere((x) =>x.id == widget.membershipId);
       membershipId = widget.membershipId;
       featuresList = _membershipList[0].features;
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
            child: CarouselView.weightedBuilder(
              flexWeights: <int>[1],
              itemSnapping: true,
              controller: _carouselController,
              scrollDirection: Axis.horizontal,
              itemCount: _membershipList.length,
              onIndexChanged: (value) {
                setState(() {
                  membershipId = _membershipList[value].id;
                  membershipName = _membershipList[value].name;
                  featuresList = _membershipList[value].features;
                });
              },
              itemBuilder: (BuildContext context, int index){
                return Card(
                  elevation: 0.2,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(_membershipList[index].name,
                              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                              textAlign: TextAlign.center,softWrap: false,),
                          ),
                        ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(10),
                              itemCount: featuresList.length,
                              itemBuilder: (BuildContext context, int index){
                                return ListTile(
                                  title: Text(featuresList[index]['name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),softWrap: false,),
                                  subtitle: Text(featuresList[index]['name'],style: TextStyle(fontSize: 14),softWrap: false,),
                                );
                              }
                            ),
                          )
                      ],
                    ),
                  ),
                );
              } 
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: ElevatedButton(
            onPressed: () {
              showDialog(context: context, 
                builder: (context)=> UpgradeMembershipDialog(Id: widget.id,membershipId: membershipId!,
                  newMembership: user,newMembershipName: membershipName,));
            },
             child: Text("Upgrade Membership")))
      ],
    );
  }
}