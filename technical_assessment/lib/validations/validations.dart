extension StringExtension on String{

  bool isEmail() {
    final RegExp reg = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
    return reg.hasMatch(this);
  }
  
}