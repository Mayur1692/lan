import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('es'),
          Locale('hi'),
          Locale('mr')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hi_text'.tr()),
              const SizedBox(height: 30),
              Text('Im_from_guj'.tr()),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("en"));
                    },
                    child: const Text('English'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("es"));
                    },
                    child: const Text('Inglés'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("hi"));
                    },
                    child: const Text('अंग्रेज़ी'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("mr"));
                    },
                    child: const Text('ગુજરાતી'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
