import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchify/core/constants/app_color.dart';
import 'package:matchify/core/constants/app_strings.dart';
import 'package:matchify/features/dating_list/data/models/dating_model.dart';
import 'package:matchify/features/dating_list/data/sources/remote/dating_api_service.dart';
import 'package:matchify/features/dating_list/presentation/bloc/dating_cubit.dart';
import 'package:matchify/features/dating_list/presentation/bloc/dating_state.dart';
import 'package:matchify/features/dating_list/presentation/widgets/event_tile.dart';
import 'package:matchify/gen/assets.gen.dart';

class DatingList extends StatefulWidget {
  const DatingList({super.key});

  @override
  State<DatingList> createState() => _DatingListState();
}

class _DatingListState extends State<DatingList> {
  @override
  void initState() {
    super.initState();
    context.read<DatingCubit>().attemptToLoadData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.05),
                child: Container(
                  height: height * 0.17,
                  decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.025),
                          child: Row(
                            children: [
                              Image.asset(
                                height: height * 0.02,
                                Assets.images.arrowLeft.path,
                                color: AppColors.secondaryColor,
                              ),
                              SizedBox(width: width * 0.24),
                              const Text(
                                AppStrings.datingList,
                                style: TextStyle(color: AppColors.secondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 2.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Image.asset(
                                Assets.images.search.path,
                                height: height * 0.03,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<DatingCubit, DatingState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoadedState) {
                    return ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return EventTile(
                          name: event.fullName,
                          title: '',
                          distance: '',
                          location: event.country,
                          startDate: event.birthDate,
                          time: '',
                        );
                      },
                    );
                  } else if (state is FailureState) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
