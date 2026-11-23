import 'package:material_ui/material_ui.dart';

import '../../data/services.dart';
import '../../storage/stored_user.dart';
import '../sign_in/sign_in.dart';

class DeletProfileWidget extends StatefulWidget {
  const DeletProfileWidget({super.key});

  @override
  State<DeletProfileWidget> createState() => _DeletProfileWidgetState();
}

class _DeletProfileWidgetState extends State<DeletProfileWidget> {

  String? id = '';
  void setDeleteId()async{
    id = await StoredUser().getStoredUser();
  }

  @override
  void initState() {
    setDeleteId();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      icon: Icon(Icons.person_remove_alt_1_sharp,),
      title: const Text('Are you sure you wish to delete your profile?', style: TextStyle(fontSize: 14)),
      content: const Text('Be aware that all of your will be removed', style: TextStyle(fontSize: 12)),
      actionsPadding: EdgeInsets.all(5),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No')),
        ElevatedButton(
          onPressed: () {
            deleteUser();
          },
          child: const Text('Yes')),
      ],
    );
  }

  void deleteUser()async{
    if(await DataServices().deleteUser(id))
    {
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.check_box,),
          title: const Text('Profile has been deleted', style: TextStyle(fontSize: 14)),
          actionsPadding: EdgeInsets.all(5),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () {
                StoredUser().removeStoredUser();
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => SignInPage()),
                (route) => false);
              },
              child: const Text('Okay')),
          ],
        )
      );
    } else{
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text('Failed to Delete Profile', style: TextStyle(fontSize: 14)),
          actionsPadding: EdgeInsets.all(5),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay')),
          ],
        )
      );
    }  
  }
}