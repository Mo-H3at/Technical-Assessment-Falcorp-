import 'package:material_ui/material_ui.dart';

import '../../../data/data_classes.dart';
import '../../../data/services.dart';

class StarterHomeWidget extends StatefulWidget {
  const StarterHomeWidget({super.key,required this.membership});
  final String? membership;
  @override
  State<StarterHomeWidget> createState() => _StarterHomeWidgetState();
}

class _StarterHomeWidgetState extends State<StarterHomeWidget> {

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
    return busy? 
    CircularProgressIndicator():
     GridView.builder(
     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), 
      itemCount: membershipDetail.features.length,
      itemBuilder: (BuildContext context,int index){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 0.2,
            color: const Color.fromARGB(255, 14, 158, 236),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(membershipDetail.features[index]["name"],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}