import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Hand off from native splash to this identical-looking Flutter
    // splash on the first frame so there is no visible gap.
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFF6EC),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/img_app_logo.png'),
          width: 120,
        ),
      ),
    );
  }
}
