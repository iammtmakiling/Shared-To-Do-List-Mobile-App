import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './providers/auth_provider.dart';
import './providers/todo_provider.dart';
import 'pages/sign_in.dart';
import 'pages/userprofile.dart';
import 'providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TodoListProvider())),
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
        ChangeNotifierProvider(create: ((context) => UserListProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const AuthWrapper()},
      theme: ThemeData(
        primaryColor: const Color(0xff967259),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff967259),
          foregroundColor: Colors.white,
        )),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xff967259)),
          ),
          labelStyle: TextStyle(
            color:  Color(0xff967259)
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: const Color(0xff967259),
        )),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color(0xff967259)),
        ),
        backgroundColor: const Color(0xffF4F8FB),
        fontFamily: 'Roboto',
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthProvider>().isAuthenticated) {
      return const OwnProfilePage();
    } else {
      return const LoginPage();
    }
  }
}
