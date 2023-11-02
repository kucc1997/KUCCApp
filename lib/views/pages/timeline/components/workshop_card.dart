import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../event_detail/event_page.dart';
import 'category_card.dart';
import 'time.dart';
import 'workshop_detail.dart';

class WorkshopCard extends HookWidget {
  final String category;
  final DateTime dateTime;
  final String workshopName;
  final String location;
  final int noOfPeople;

  const WorkshopCard(
      {super.key,
      required this.category,
      required this.dateTime,
      required this.workshopName,
      required this.location,
      required this.noOfPeople});

  @override
  Widget build(BuildContext context) {
    int hour = dateTime.hour;
    int min = dateTime.minute;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EventPage(category: category, time: "15:00", workshopName: workshopName, room: location, PeopleNo: noOfPeople.toString())));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [CategoryCard(category: category), TimeBox(time: "$hour:$min")],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    WorkshopDetail(
                        workshopName: workshopName,
                        room: location,
                        block: "9",
                        peopleNumber: "$noOfPeople")
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
