import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:timelines/timelines.dart';

//return FixedTimeline.tileBuilder(
//  theme: TimelineThemeData.vertical().copyWith(
//      nodePosition: 0.08, connectorTheme: const ConnectorThemeData(thickness: 2.8)),
//  builder: TimelineTileBuilder(
//    indicatorBuilder: (_, index) => DateAndDot(
//      dateTime: dateTime,
//    ),
//    indicatorPositionBuilder: (_, index) => 0,
//    startConnectorBuilder: (_, index) => const IndicatorConnector(),
//    endConnectorBuilder: (_, index) => const IndicatorConnector(),
//    contentsAlign: ContentsAlign.basic,
//    contentsBuilder: (context, index) => Padding(
//      padding: const EdgeInsets.only(left: 8, top: 18),
//      child: Column(
//          children: (dayEvents.value[day]!..sort()).map((event) {
//        return WorkshopCard(
//            workshopName: event.title,
//            dateTime: event.dateTime,
//            category: event.categories.first,
//            location: event.location,
//            noOfPeople: event.noOfPeople);
//      }).toList()),
//    ),
//    itemCount: 1,
//  ),
//);
//class RoutineTimeline extends HookWidget {
//  @override
//  Widget build(BuildContext context) {
//    return FixedTimeline.tileBuilder(
//        theme: TimelineThemeData.vertical()
//            .copyWith(nodePosition: 0.08, connectorTheme: const ConnectorThemeData(thickness: 2.8)),
//        builder: TimelineTileBuilder(
//            indicatorPositionBuilder: (_, index) => 0,
//            indicatorBuilder: (_, index) => Indicator.dot(
//                  color: Colors.red,
//                  size: 8,
//                ),
//            itemCount: 10,
//            contentsBuilder: (x, y) =>
//                Padding(padding: EdgeInsets.all(10), child: Text("${7 + y}"))));
//  }
//}
//class Example1Vertical extends StatelessWidget {
//const Example1Vertical({Key? key}) : super(key: key);

//@override
//Widget build(BuildContext context) {
//return SliverList(
//delegate: SliverChildListDelegate(
//<Widget>[
//Container(
//color: Colors.white,
//child: TimelineTile(),
//),
//],
//),
//);
//}
//}
//class RoutineTimeline extends HookWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SliverList(
//      delegate: SliverChildListDelegate([
//        Column(
//          children: [
//            Container(
//                constraints: const BoxConstraints(maxHeight: 100),
//                child: TimelineTile(
//                  axis: TimelineAxis.vertical,
//                  alignment: TimelineAlign.center,
//                )),
//            TimelineTile(axis: TimelineAxis.vertical)
//            //TimelineTile(node: Text("asldfjsal"), direction: TimelineA),
//          ],
//        ),
//      ]),
//    );
//  }
//}
//

//{
//    "batch" : "2021",
//    "schedule" : {
//        "monday" : [
//            "time"
//        ]
//    }
//    //"sunday" : {
//    //    "7" : "PHYSICS 102",
//    //    "8" : "PHYSICS 102",
//    //    "9" : "PHYSICS 102",
//    //    "10" : "Break",
//    //    "7" : "PHYSICS 102",
//    //    "7" : "PHYSICS 102",
//    //    "7" : "PHYSICS 102",
//    //    "7" : "PHYSICS 102",
//    //    "7" : "PHYSICS 102",
//    //}
//}
class Routine extends HookWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    const nodeWidthCoverage = 0.15;
    const double singleHourHeight = 96;
    const startTime = 7; // To be determined by batch which can be 9
    const endTime = 16; // To be determined by batch which can be 2

    return Scaffold(
      body: Column(
        children: [
          KUCCAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Stack(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: endTime - startTime,
                    itemBuilder: (x, i) {
                      return TimelineTile(
                        nodePosition: nodeWidthCoverage,
                        oppositeContents: Container(
                          height: singleHourHeight,
                          child: Text(
                            "${startTime + i} ${(startTime + i) > 12 ? "PM" : "AM"}",
                            style: GoogleFonts.manrope(fontSize: 18),
                          ),
                        ),
                        node: TimelineNode(
                          indicatorPosition: 0.0,
                          indicator: DotIndicator(size: 8),
                          startConnector: SolidLineConnector(),
                          endConnector: SolidLineConnector(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 38,
                    left: (nodeWidthCoverage * MediaQuery.of(context).size.width),
                    child: Container(
                      width: ((1 - nodeWidthCoverage) * MediaQuery.of(context).size.width),
                      child: Column(
                        children: [
                          RoutineSubjectCard(
                            singleHourHeight: singleHourHeight,
                            noOfHours: 1,
                            subject: "COMP 101",
                          ),
                          RoutineSubjectCard(
                            singleHourHeight: singleHourHeight,
                            noOfHours: 2,
                            subject: "PHY 102",
                          ),
                          RoutineSubjectCard(
                            singleHourHeight: singleHourHeight,
                            noOfHours: 2,
                            subject: "MATH 202",
                          ),
                          RoutineSubjectCard(
                            singleHourHeight: singleHourHeight,
                            noOfHours: 1,
                            subject: "EDRG 215",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoutineSubjectCard extends StatelessWidget {
  final double singleHourHeight;
  final int noOfHours;
  final String subject;

  RoutineSubjectCard(
      {super.key, required this.singleHourHeight, required this.noOfHours, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: singleHourHeight * noOfHours,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 16, left: 18),
        child: Container(
          constraints: const BoxConstraints.expand(),
          padding: EdgeInsets.all(18),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$subject",
                  style: GoogleFonts.manrope(
                      fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2 hour",
                      style: GoogleFonts.manrope(
                          fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    Text(
                      "12:00PM - 14:00PM",
                      style: GoogleFonts.manrope(
                          fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ],
                )
              ]),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xFF72C0D1),
          ),
          //decoration: BoxDecoration(),
        ),
      ),
    );
  }
}
