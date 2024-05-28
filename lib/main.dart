import 'package:bloc_flutter/config/routes/routes.dart';
import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviveLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomePage(),

      initialRoute: RoutesName.splashScreen, // Initial route
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviveLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
}
