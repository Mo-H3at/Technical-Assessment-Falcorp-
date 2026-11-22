import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/services.dart';
import 'package:technical_assessment/pages/main_display/main_tabs.dart';
import 'package:technical_assessment/pages/sign_up/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late FocusNode nameNode;
  late FocusNode emailNode;

  @override
  void initState() {
    emailController = TextEditingController();
    emailNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            const Text('Please Sign In'),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                focusNode: emailNode,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: ()  {
                signInCheck();
              }, 
              child: const Text("Sign In")),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage())), 
                child: Text("Sign Up")),
            )
          ],
        ),
      ),
    );
  }

  
  void signInCheck()async{
    if(await DataServices().signIn(emailController.text))
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
}