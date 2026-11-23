import 'package:technical_assessment/data/data_classes.dart';

extension StringExtension on String{

  bool isEmail() {
    final RegExp reg = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
    return reg.hasMatch(this);
  }

}

bool emailTaken(List<User> users, String email){
  bool taken = users.any((x) => x.email.toLowerCase() == email.toLowerCase());
  return taken;
}
