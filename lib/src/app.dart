import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'bloc/home_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeProvider(
      child: MaterialApp(
        title: 'Automation Test',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes,
      ),
    );
  }

  static Route<dynamic> routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      default:
    }
  }
}
