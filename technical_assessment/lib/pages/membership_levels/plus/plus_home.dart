import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/pages/features/main_feature.dart';

import '../../../data/data_classes.dart';
import '../../../data/services.dart';

class PlusHomeWidget extends StatefulWidget {
  const PlusHomeWidget({super.key,required this.membership});
  final String? membership;
  @override
  State<PlusHomeWidget> createState() => _PlusHomeWidgetState();
}

class _PlusHomeWidgetState extends State<PlusHomeWidget> {
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
     Center(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: GridView.builder(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 3
          ), 
          itemCount: membershipDetail.features.length,
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainFeaturePage(feature:membershipDetail.features[index]))),
              child: Card(
                elevation: 0.2,
                color: const Color.fromARGB(255, 240, 79, 79),
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
        ),
      ),
    );
  }
}