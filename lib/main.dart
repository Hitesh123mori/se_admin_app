import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/FacilityProvider.dart';
import 'package:se_admin_app/Providers/InfoProvider.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/Providers/ProductProvider.dart';
import 'package:se_admin_app/platform_define.dart';
import 'package:se_admin_app/screens/desktop_screens/home_desktop2.dart';
import 'package:se_admin_app/screens/temp.dart';
import 'Providers/MainOptionProvider.dart';
import 'constant/constants_provider.dart';
import 'firebase_options.dart';


late Size mq ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ConstantsProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>MainOptionProvider()),
        ChangeNotifierProvider(create: (context)=>InfoProvider()),
        ChangeNotifierProvider(create: (context)=>KClientProvider()),
        ChangeNotifierProvider(create: (context)=>FacilityProvider()),
      ], child: AdminApp()));
}

class AdminApp extends StatefulWidget {
  const AdminApp({super.key});

  @override
  State<AdminApp> createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SE - Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: PlatformDefine(),

      // home: PlatformDefine(),

      home: PlatformDefine(),
    );

  }
}
