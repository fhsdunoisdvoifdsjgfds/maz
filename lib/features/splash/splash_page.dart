import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../core/config/my_colors.dart';
import '../../core/config/utilities.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = false;

  void _loadd() async {
    await initDatabase();
    setState(() {
      isLoading = true;
    });

    if (mounted) context.read<IncExpBloc>().add(GetIncExpEvent());

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          if (onboard) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadd();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: MyColors.main,
        ),
      ),
    );
  }
}
