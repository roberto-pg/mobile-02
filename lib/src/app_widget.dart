import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_mob/src/configuration/configuration_module.dart';
import 'package:queue_mob/src/configuration/dio/custom_dio.dart';
import 'package:queue_mob/src/home/home_page.dart';
import 'package:queue_mob/src/queue/queue_module.dart';
import 'configuration/pages/configuration_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ...queueModule,
          ...configurationModule,
        ],
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          routes: <String, WidgetBuilder>{
            '/': (_) => const HomePage(),
            '/config': (_) => ConfigurationPage(customDio: CustomDio()),
          },
        ));
  }
}
