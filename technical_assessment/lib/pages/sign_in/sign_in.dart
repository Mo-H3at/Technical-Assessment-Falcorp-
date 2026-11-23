import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/services.dart';
import 'package:technical_assessment/logo/logo.dart';
import 'package:technical_assessment/pages/main_display/main_tabs.dart';
import 'package:technical_assessment/pages/sign_up/sign_up.dart';
import 'package:technical_assessment/validations/validations.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            Container(
              child: LogoImage(),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
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

    var email = emailController.text.trim();
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