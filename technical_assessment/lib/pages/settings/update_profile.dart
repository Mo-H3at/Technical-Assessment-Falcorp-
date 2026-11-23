import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/storage/stored_user.dart';

import '../../data/data_classes.dart';
import '../../data/services.dart';
import '../main_display/main_tabs.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var membershipId = '';
  String? id;
  late User user;
  bool busy = false;

  Future<void> getUser() async {
    busy = true;
    id = await StoredUser().getStoredUser();
    user =  await DataServices().getUser(id!);
    setState(() {
      
    });
    busy = false;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile'),
        ),
        body:busy
        ? Center(child: CircularProgressIndicator())
        : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 18,
              children: [
                ListTile(
                  title: Text("Username"),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text(user.email),
                ),
               
                Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                   child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Update',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        Icon(Icons.keyboard_double_arrow_right,),
                      ],
                    ),
                  ),
                   onTap: () {
                    setState(() {
                      nameController.text = user.name;
                      emailController.text = user.email;
                    });
                    newProfile();
                  },
                ),
               ),
              ],
            ),
          ),
        ),
      )
    );
  }

  newProfile()async{
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () { 
                setState(() {
                  user = User(id: id!, name: nameController.text, email: emailController.text, membershipId: user.membershipId);
                });
                saveProfile();
                }
              ,
              child: const Text('Save')),
          ],
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 18,
              children: [
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Enter name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
               
              ],
            ),
        )
      );
  }

  saveProfile()async{
    if(await DataServices().updateProfileDetails(id,user))
    {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MainTabsPage()));
    } else{
      showDialog(context: context, builder: (context) =>
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              icon: Icon(Icons.warning_amber_rounded,),
              title: const Text('Email Already Exists', style: TextStyle(fontSize: 14)),
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