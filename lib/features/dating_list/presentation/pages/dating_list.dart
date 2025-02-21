import 'package:flutter/material.dart';
import 'package:matchify/core/constants/app_color.dart';
import 'package:matchify/core/constants/app_strings.dart';
import 'package:matchify/features/dating_list/presentation/widgets/event_tile.dart';
import 'package:matchify/gen/assets.gen.dart';

class DatingList extends StatelessWidget {
  const DatingList({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
