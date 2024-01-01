import 'package:flutter/material.dart';
import 'package:teachersguard/config/constants/assets_conts.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static String name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AssetsConsts.headerImageV1,
          fit: BoxFit.cover,
          height: size.height / 2,
          width: double.infinity,
          color: Colors.black
              .withOpacity(0.2), // Color y opacidad para agregar sombra
          colorBlendMode: BlendMode.multiply,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 3),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(), child: LoginForm()),
            )
          ],
        )
      ],
    );
  }
}
