import 'package:material_ui/material_ui.dart';

import '../../../data/data_classes.dart';
import '../../../data/services.dart';

class PremiumHomeWidget extends StatefulWidget {
  const PremiumHomeWidget({super.key,required this.membership});
  final String? membership;
  @override
  State<PremiumHomeWidget> createState() => _PremiumHomeWidgetState();
}

class _PremiumHomeWidgetState extends State<PremiumHomeWidget> {
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
     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 3,
      
      ), 
      itemCount: membershipDetail.features.length,
      itemBuilder: (BuildContext context,int index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 0.2,
            color: const Color.fromARGB(255, 35, 255, 23),
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