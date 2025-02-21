import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchify/features/dating_list/domain/usecases/get_dating_events.dart';
import 'package:matchify/features/dating_list/presentation/bloc/dating_cubit.dart';
import 'package:matchify/features/dating_list/presentation/pages/dating_list.dart';

class MyApp extends StatelessWidget {
  final GetDatingEvents getDatingEvents;
  const MyApp({super.key, required this.getDatingEvents});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DatingCubit(getDatingEvents),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DatingList(),
      ),
    );
  }
}
