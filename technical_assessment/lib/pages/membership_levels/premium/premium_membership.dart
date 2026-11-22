import 'package:material_ui/material_ui.dart';

import '../../../data/data_classes.dart';
import '../../../data/services.dart';

class PremiumMembershipWidget extends StatefulWidget {
  const PremiumMembershipWidget({super.key,required this.membership});

  final String? membership;

  @override
  State<PremiumMembershipWidget> createState() => _PremiumMembershipWidgetState();
}

class _PremiumMembershipWidgetState extends State<PremiumMembershipWidget> {
   late final Membership membershipDetail;

  bool busy = false;

  Future<void> getMembership() async {
    busy = true;
    List<Membership> membershipList = await DataServices().getMembershipList();
    setState(() {
      membershipDetail = membershipList.where((x) => x.id == widget.membership).first;
    });
    busy = false;
  }
  
  @override
  void initState() {
    getMembership();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return busy ?
    CircularProgressIndicator():
     ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: membershipDetail.features.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(membershipDetail.features[index]['name'],style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
          trailing: Icon(Icons.arrow_forward_outlined),
        );
      }
    );
  }
}