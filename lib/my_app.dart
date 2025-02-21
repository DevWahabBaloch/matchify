import 'package:flutter/material.dart';
import 'package:matchify/features/dating_list/presentation/pages/dating_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: DatingList());
  }
}
