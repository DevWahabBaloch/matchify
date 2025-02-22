import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matchify/core/di/service_locator.dart';
import 'package:matchify/features/dating_list/domain/usecases/get_dating_events.dart';
import 'package:matchify/my_app.dart';

Future<void> main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp(
    getDatingEvents: sl<GetDatingEvents>(),
  ));
}
