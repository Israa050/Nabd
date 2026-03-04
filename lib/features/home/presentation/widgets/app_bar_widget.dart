import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({super.key}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: Theme.of(context).appBarTheme.elevation,
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/placeholder.jpg'),
            ),
            SizedBox(width: 8),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Hi, ${context.watch<AuthCubit>().state.user?.firstName} ',
                    style: context.typography.displayTitle,
                  ),

                  TextSpan(
                    text: '👋🏿',
                    style:  context.typography.displayTitle.copyWith(letterSpacing: 0.03,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            'assets/svgs/notification.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).appBarTheme.actionsIconTheme?.color ??
                  Color(0xff1D3A70),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
