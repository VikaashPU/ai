import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

// 🔐 Login Pages
import 'screens/supplier_login.dart';
import 'screens/procurement_login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PowerXchange.ai',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      /// 🌐 Initial route
      initialRoute: '/office-login',

      /// 🧭 App routes (PATH-BASED)
      routes: {
        '/supplier-login': (context) => const SupplierLoginPage(),
        '/office-login': (context) => const ProcurementLoginPage(),
      },
    );
  }
}
