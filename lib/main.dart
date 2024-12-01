import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/dynamic_ui_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String>(
        future: rootBundle.loadString('assets/ui_config.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading configuration"));
          }
          final config = snapshot.data!;
          return DynamicUIScreen(config: config);
        },
      ),
    );
  }
}
