import 'package:material_ui/material_ui.dart';

import '../../data/data_classes.dart';
import '../../data/services.dart';


class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key,required this.membershipLevel});
  final String? membershipLevel;
  
  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {

  late final Membership membershipDetail;
  bool busy = false;
  bool tileExpanded = false;

  Future<void> getMembership() async {
    busy = true;
    List<Membership> membershipList = await DataServices().getMembershipList();
    setState(() {
      membershipDetail = membershipList.where((x) => x.id == widget.membershipLevel).first;
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
     Column(
       children: [
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Membership Benefits',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          )
        ),
         Expanded(
          flex: 1,
           child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: membershipDetail.features.length,
            itemBuilder: (BuildContext context, int index){
              return ExpansionTile(
                collapsedIconColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text(membershipDetail.features[index]['name'],style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                tilePadding: EdgeInsets.all(1),
                childrenPadding: const EdgeInsets.all(8.0),
                children: [
                  Text('This text only exists to show the tiles expand accordingly')
                  ],
              );
            }
          ),
         ),
       ],
     );
  }
}