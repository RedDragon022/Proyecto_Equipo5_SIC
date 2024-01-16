import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/presentation/providers/user/user_provider.dart';
import 'package:teachersguard/presentation/views/views.dart';

class ScheduleView extends ConsumerWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textStyle = Theme.of(context).textTheme;
    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
          fontSize: textStyle.displaySmall?.fontSize,
          fontWeight: FontWeight.w600
        );


    final user = ref.watch(userProvider);
    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text((user.isAdmin) ? 'Asistencia':'Agenda', style: titleStyle),
          const SizedBox(height: 20),
          (user.isAdmin)? AdminView() : UserView(userId: user.id)
        ],
      ),
    );
  }
}
