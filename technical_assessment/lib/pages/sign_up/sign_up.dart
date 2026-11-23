import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/pages/sign_in/sign_in.dart';
import 'package:technical_assessment/validations/validations.dart';

import '../../data/data_classes.dart';
import '../../data/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late List<Membership> membershipList;
  late List<dynamic> membershipOptions = [{'id': '','name':''}];
  var membershipId = '';
  bool busy = false;

  Future<void> getMembershipOptions() async {
    busy = true;
    membershipList = await DataServices().getMembershipList();
    setState(() {
      membershipOptions = membershipList.map((x) => {'id': x.id,'name':x.name}).toList();
    });
    busy = false;
  }

  @override
  void initState() {
    getMembershipOptions();
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
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
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
                Center(
                  child: DropdownMenu(
                    label: Text('Please Select your membership tier'),
                    onSelected: (value) {
                      setState(() {
                        membershipId = value;
                      });
                    },
                    dropdownMenuEntries:membershipOptions.map<DropdownMenuEntry>((x) {
                    return busy?DropdownMenuEntry(
                      value: '',
                      label: ''
                      ):DropdownMenuEntry(
                      value: x['id'],
                      label: x['name']
                      );
                    }).toList(),),
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
                        Text('Continue',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        Icon(Icons.keyboard_double_arrow_right,),
                      ],
                    ),
                  ),
                   onTap: () {
                    signUpCheck();
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

  void signUpCheck()async{
    var name = nameController.text.trim();
    var email = emailController.text.trim();

    if(name == "" || email == ""){
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text('Please fill in All fields', style: TextStyle(fontSize: 14)),
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
      return;
    }
    if(!email.isEmail()){
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text("Please enter correct email format", style: TextStyle(fontSize: 14)),
          content: const Text("Example: user@emaple.com", style: TextStyle(fontSize: 10)),
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
      return;
    }

    if(membershipId == ""){
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text('Please select membership tier', style: TextStyle(fontSize: 14)),
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
      return;
    }
  showDialog(context: context,
    barrierDismissible: false,
     builder: (context) =>
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              const Text('Are you sure?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No'))
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          signUp();
                        } ,
                        child: const Text('Yes'))
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
  }

  void signUp() async {
    Navigator.pop(context);

    if(await DataServices().signUp(nameController.text, emailController.text, membershipId))
    {
      successful();
    } else{
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text('Please enter correct email', style: TextStyle(fontSize: 14)),
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

  void successful(){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.person_add_alt_1_rounded,),
          title: const Text('Your Profile has been saved', style: TextStyle(fontSize: 14)),
          actionsPadding: EdgeInsets.all(5),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => SignInPage()), (route) => false);
              },
              child: const Text('Okay')),
          ],
        )
      );
  }
}