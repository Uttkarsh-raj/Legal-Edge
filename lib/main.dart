import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/screens/main_auth_page.dart';
import 'package:hackman/screens/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyACMClGpjlLPknRiM7MijokmjX3jXf_dMM',
      appId: '1:275560008515:android:50b532fe33a1255c493df6',
      messagingSenderId: '275560008515',
      projectId: 'hackman-56feb',
    ),
  );
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
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColorsConstants.primaryBackgroundColor.withOpacity(0.2),
        ),
      ),
      routes: {
        "/posts": (context) => const PostPage(),
      },
      home: const MainAuthPage(),
    );
  }
}
