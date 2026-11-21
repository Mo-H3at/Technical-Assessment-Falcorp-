import 'package:flutter/material.dart';

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
             
            ],
          ),
        ),
      )
    );
  }
}