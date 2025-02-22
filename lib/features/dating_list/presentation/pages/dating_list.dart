import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matchify/core/constants/app_color.dart';
import 'package:matchify/core/constants/app_strings.dart';
import 'package:matchify/core/di/service_locator.dart';
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
    sl<DatingCubit>().attemptToLoadData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Container(
                height: height * 0.17,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
                        child: Row(
                          children: [
                            Image.asset(
                              height: height * 0.02,
                              Assets.images.arrowLeft.path,
                              color: AppColors.secondaryColor,
                            ),
                            SizedBox(width: width * 0.21),
                            Text(
                              AppStrings.datingList,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.secondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        elevation: 2.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: AppStrings.search,
                            hintStyle: GoogleFonts.montserrat(),
                            prefixIcon: Icon(
                              Icons.search,
                              size: height * 0.035,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: BlocBuilder<DatingCubit, DatingState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadedState) {
                      return RefreshIndicator(
                        onRefresh: () => sl<DatingCubit>().attemptToLoadData(),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.events.length,
                          itemBuilder: (context, index) {
                            final event = state.events[index];
                            String dobString = event.registeredDate;
                            DateTime dob = DateTime.parse(dobString);
                            String formattedDob = DateFormat('yyyy-MM-dd').format(dob);
                            return EventTile(
                              name: event.fullName,
                              title: event.title,
                              distance: event.distance,
                              location: event.country,
                              startDate: formattedDob,
                              time: event.time,
                              image: event.profilePicture,
                            );
                          },
                        ),
                      );
                    } else if (state is FailureState) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
