import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'core/config/my_colors.dart';
import 'core/config/router.dart';
import 'blocs/button/button_bloc.dart';
import 'blocs/navbar/navbar_bloc.dart';
import 'blocs/inc_exp/inc_exp_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IncExpBloc()),
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => ButtonBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: false,
          primarySwatch: Colors.grey,
          fontFamily: MyFonts.ns400,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: MyColors.main,
          ),
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
          ),
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
