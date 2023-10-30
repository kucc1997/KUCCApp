import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'category_card.dart';
import 'time.dart';
import 'workshop_detail.dart';

class WorkshopCard extends HookWidget {
  final String category;
  final String time;
  final String workshopName;
  final String room;
  final String PeopleNo;

  WorkshopCard(
      {super.key,
      required this.category,
      required this.time,
      required this.workshopName,
      required this.room,
      required this.PeopleNo});

  @override
  Widget build(BuildContext context) {
     
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {},
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
                    children: [
                      CategoryCard(category: category),
                      TimeBox(time: time)
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  WorkshopDetail(
                      workshopName: workshopName,
                      room: room,
                      block: "9",
                      peopleNumber: PeopleNo)
                ],
              ),
            )),
      ),
    );
  }
}
