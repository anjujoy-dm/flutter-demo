import 'package:flutter/material.dart';
import 'app/injection.dart';
import 'theme/app_theme.dart';
import 'features/menu/presentation/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Dependency Injection
  await configureDependencies();

  // 2. Start the App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      // 3. Apply the Theme here
      theme: AppTheme.theme,
      // 4. Set MenuPage as home screen
      home: const MenuPage(),
    );
  }
}
