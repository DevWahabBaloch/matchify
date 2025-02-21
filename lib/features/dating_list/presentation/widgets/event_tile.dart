import 'package:flutter/material.dart';
import 'package:matchify/core/constants/app_color.dart';
import 'package:matchify/gen/assets.gen.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String name;
  final String distance;
  final String location;
  final String startDate;
  final String time;

  const EventTile(
      {super.key,
      required this.title,
      required this.name,
      required this.distance,
      required this.location,
      required this.startDate,
      required this.time});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColors.eventTileColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Assets.images.calender1.path,
                        height: height * 0.025,
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        title,
                        style: const TextStyle(color: AppColors.textColor, fontSize: 20),
                      )
                    ],
                  ),
                  Image.asset(
                    Assets.images.more.path,
                    height: height * 0.025,
                  ),
                ],
              ),
              const Divider(
                color: AppColors.dividerColor,
                height: 25,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            Assets.images.pic.path,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(distance, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 0.02),
                      Image.asset(
                        Assets.images.message.path,
                        height: height * 0.03,
                      ),
                      SizedBox(width: width * 0.03),
                      Image.asset(
                        Assets.images.phone.path,
                        height: height * 0.022,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.images.calender1.path,
                            height: height * 0.02,
                          ),
                          SizedBox(width: width * 0.02),
                          const Text(
                            'Date',
                            style: TextStyle(color: AppColors.textColor, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        startDate,
                        style: const TextStyle(color: AppColors.textColor, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time,
                        style: const TextStyle(color: AppColors.textColor, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.003,
                    height: height * 0.1,
                    decoration: const BoxDecoration(color: AppColors.dividerColor),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.images.location.path,
                            height: height * 0.02,
                          ),
                          SizedBox(width: width * 0.02),
                          const Text(
                            'Location',
                            style: TextStyle(color: AppColors.textColor, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.1),
                        child: Text(
                          location,
                          style: const TextStyle(color: AppColors.textColor, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
