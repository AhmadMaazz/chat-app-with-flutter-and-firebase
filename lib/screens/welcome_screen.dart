// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      // vsync is our ticker here
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // animation = CurvedAnimation(parent: controller!, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.black, end: Colors.yellow).animate(controller);

    controller.forward();
    // controller?.reverse(from: 2);

    // animation?.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller?.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller?.forward();
    //   }
    // });

    controller.addListener(
      () {
        setState(() {});
        // print(controller.value);
        // print(animation.value);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent.withOpacity(controller!.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller.value * 100,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),

                // AnimatedTextKit(
                //   animatedTexts: [
                //     TypewriterAnimatedText(
                //       'Flash Chat',
                //       textStyle: const TextStyle(
                //         fontSize: 45.0,
                //         fontWeight: FontWeight.w900,
                //         color: Colors.black,
                //       ),
                //       speed: const Duration(milliseconds: 300),
                //     ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.black,
              text: 'Log In',
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.black,
              text: 'Register',
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
