import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud/models/user.dart';
import 'package:hive_crud/screens/LoginScreen.dart';
import 'package:hive_crud/routes/route_generator.dart';
import 'package:hive_crud/utils/Palette.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapter
  Hive.registerAdapter(UserAdapter());

  // Open the box
  await Hive.openBox<User>('users');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive + BLoc',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
