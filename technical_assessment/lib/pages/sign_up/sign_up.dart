import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/pages/sign_in/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late FocusNode nameNode;
  late FocusNode emailNode;
  final List<String> list = <String>["Starter", "Plus","Premium"];
  String? dropdownvalue = "Select Membership";

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    nameNode = FocusNode();
    emailNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nameNode.dispose();
    emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              TextField(
                controller: nameController,
                focusNode: nameNode,
                onSubmitted: (value) => emailNode.nextFocus(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
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
                                      onPressed: () => Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(builder: (context) => SignInPage()), (route) => false),
                                      child: const Text('Yes'))
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                },
              ),
             ),
            ],
          ),
        ),
      )
    );
  }
}