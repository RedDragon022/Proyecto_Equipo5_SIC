import 'package:flutter/material.dart';

import '../../../config/constants/assets_conts.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static String name = 'register-screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final size = MediaQuery.of(context).size;
    

    return Stack(
      children: [
        Image.asset(
          AssetsConsts.headerImageV2,
          fit: BoxFit.cover,
          height: size.height / 2,
          width: double.infinity,
          color: Colors.black
              .withOpacity(0.2), // Color y opacidad para agregar sombra
          colorBlendMode: BlendMode.multiply,
        ),
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
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
                child: const RegisterForm(),
              )
            ],
          ),
        )
      ],
    );
  }
}
