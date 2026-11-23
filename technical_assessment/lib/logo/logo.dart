import 'package:material_ui/material_ui.dart';

class LogoAvatar extends StatelessWidget {
  const LogoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundImage: (AssetImage('assets/images/logo.jpg')),
      )
    );
  }
}

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/logo.jpg'),
        radius: 80,
      )
    );
  }
}