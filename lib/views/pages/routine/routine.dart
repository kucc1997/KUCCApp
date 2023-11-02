import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/event_detail/components/event_button.dart';
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

//class ArrowAnimation extends HookWidget {
//  @override
//  Widget build(BuildContext context) {
//    final controller = useAnimationController(duration: const Duration(milliseconds: 200));
//    final animation = useAnimation(controller);
//
//    return AnimatedBuilder(
//        animation: controller,
//        builder: (context, child) {
//          return Transform(
//              transform: Transform(
//            alignment: Alignment.center,
//            transform: Matrix4.identity()
//              ..setEntry(3, 2, 0.002)
//              ..rotateX(animation * 3.14),
//            child: Icon(Icons.keyboard_arrow_up),
//          ));
//        });
//  }
//}

class RoutineFacultyBatchButton extends HookWidget {
  const RoutineFacultyBatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 0));
    final animation = useAnimation(controller);
    final primaryColor = useState(Colors.white);
    final textColor = useState(const Color(0xFF394078));
    // Create an OverlayEntry variable to hold the dropdown widget
    OverlayEntry? overlayEntry;
    void showDropDown() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset(0.0, size.height));

      overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: offset.dy,
            width: size.width,
            left: offset.dx,
            child: Text("alsjdfsalfjasljflsjfsaljfaj"),
          );
        },
      );

      Overlay.of(context)!.insert(overlayEntry!);
    }

    void hideDropdown() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        hideDropdown(); // Close the dropdown when there's an outside click
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          onTap: () {
            //showDropDown();
            if (controller.isCompleted) {
              primaryColor.value = Color(0xFF394078);
              textColor.value = Colors.white;
              controller.reverse();
            } else {
              textColor.value = Color(0xFF394078);
              primaryColor.value = Colors.white;
              controller.forward();
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: primaryColor.value,
            ),
            width: 300,
            height: 60,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CS - 2021",
                  style: GoogleFonts.manrope(
                      color: textColor.value, fontSize: 24, fontWeight: FontWeight.w600),
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002) // Perspective effect
                        ..rotateX(animation * 3.14), // Rotate on the X-axis
                      child: Icon(Icons.keyboard_arrow_up, size: 28, color: textColor.value),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoutineFacultyBatchInput extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RoutlineWeekSliderCard extends HookWidget {
  final String week;
  RoutlineWeekSliderCard({super.key, required this.week});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration:
          BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(12))),
      alignment: Alignment.center,
      child: Text(
        week,
        style: GoogleFonts.manrope(fontSize: 22),
      ),
    );
  }
}

class RoutineWeekSlider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    const weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

    useEffect(() {
      final totalScrollDistance = scrollController.position.maxScrollExtent;
      final oneEighthOfDistance = totalScrollDistance / 8;
      void listener() {
        if (scrollController.offset >= oneEighthOfDistance) {
          // Call your function here
          debugPrint("${scrollController.offset}");
        }
      }

      scrollController.addListener(listener);
    }, []);

    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 120)),
            ...weeks.map((day) {
              return Container(
                width: 120, // Adjust the width as needed
                height: 120, // Adjust the height as needed
                padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                alignment: Alignment.center,
                child: RoutlineWeekSliderCard(week: day),
              );
            }).toList(),
            Padding(padding: EdgeInsets.only(right: 120)),
          ],
        ),
      ),
    );
  }
}

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
          const KUCCAppBar(),
          const Padding(padding: EdgeInsets.all(20)),
          const RoutineFacultyBatchButton(),
          const Padding(padding: EdgeInsets.all(20)),
          RoutineWeekSlider(),
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
