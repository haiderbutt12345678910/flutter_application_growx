import 'package:flutter/material.dart';

class ScheduleTimingsGrid extends StatefulWidget {
  final Function fun;
  const ScheduleTimingsGrid({super.key, required this.fun});

  @override
  State<ScheduleTimingsGrid> createState() => _ScheduleTimingsGridState();
}

class _ScheduleTimingsGridState extends State<ScheduleTimingsGrid> {
  List<String> timings = [
    '9:00 AM',
    '10:00 AM',
    '11:00 PM',
    '12:00 PM',
    '1:00 AM',
    '4:00 AM',
    '8:00 AM',
    '7:00 AM',
    '6:00 AM',
    '3:00 AM'
  ];
  String time = "";
  int selectedBtn = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GridView.count(
        childAspectRatio: (MediaQuery.of(context).size.width / 3) / (200 / 2),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: [
          for (int i = 0; i < timings.length; i++)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RailWay"),
                    backgroundColor:
                        selectedBtn == i ? Colors.amber : Colors.black,
                    side: const BorderSide(width: 2, color: Colors.white)),
                onPressed: () {
                  setState(() {
                    selectedBtn = i;
                    widget.fun(timings[i]);
                    //  selectedbtn = 0;
                  });
                },
                child: FittedBox(
                  child: Text(
                    timings[i],
                  ),
                )),
        ],
      ),
    );
  }
}
