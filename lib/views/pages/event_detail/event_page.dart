import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/event_detail/components/bookmark.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/eventdetail_viewmodel.dart';
import '../event_detail/components/category_card.dart';
import 'components/event_button.dart';
import 'components/detail_chip.dart';

class EventPage extends StatelessWidget {
  final String category;
  final String time;
  final String workshopName;
  final String room;
  final String PeopleNo;

  const EventPage(
      {super.key,
      required this.category,
      required this.time,
      required this.workshopName,
      required this.room,
      required this.PeopleNo});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final edvm = Provider.of<EventDetailViewModel>(context);

    return Scaffold(
        backgroundColor: const Color(0xFFE2E4F3),
        body: Column(
          children: [
            KUCCAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryCard(category: category),
                                BookMark(),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(workshopName,
                                style:
                                    GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 12,
                            ),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                DetailChip(
                                    startingIcon: Icons.person_2_outlined, information: PeopleNo),
                                DetailChip(information: "Room $room - Block 9"),
                                DetailChip(startingIcon: Icons.access_time, information: time),
                                DetailChip(information: "Free")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.057 * screenWidth,
                      bottom: 70,
                      child: Button(
                          startingIcon: Icons.star_border_outlined, buttonText: "Interested"),
                    ),
                    Positioned(
                      left: 0.057 * screenWidth,
                      bottom: 20,
                      child: Button(startingIcon: Icons.check_circle, buttonText: "Going"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
