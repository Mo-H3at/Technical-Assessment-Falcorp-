import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/data_classes.dart';

import '../../../data/services.dart';

class StarterMembershipWidget extends StatefulWidget {
  const StarterMembershipWidget({super.key, required this.membership});
  final String? membership;

  @override
  State<StarterMembershipWidget> createState() => _StarterMembershipWidgetState();
}

class _StarterMembershipWidgetState extends State<StarterMembershipWidget> {

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