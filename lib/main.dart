import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/pages/authentication/view/create_account_screen.dart';
import 'package:desafio_intgest/src/pages/authentication/view/login_screen.dart';
import 'package:desafio_intgest/src/pages/base/view/base_screen.dart';
import 'package:desafio_intgest/src/pages/task/view/new_task_screen.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomCorlors.customColorPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.Login,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.Login: (context) => const LoginScreen(),
        Routes.CREATEACCOUNT: (context) => CreateAccount(),
        Routes.BASE: (context) => const BaseScren(),
        Routes.NEWTASK: (context) => NewTaskScreen(),
      },
    );
  }
}
