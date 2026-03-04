import 'package:crypto_demo/core/di/dependency_injection.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:crypto_demo/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: AppBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: HomeScreenBody(),
      ),
    );
  }
}
