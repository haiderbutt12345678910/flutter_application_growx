import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/readVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/writeVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/mainpage.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/ContactUsWidgets/vedioChat/sceduleTimins.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_application_growx/constvar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WebSetMeeting extends StatefulWidget {
  const WebSetMeeting({super.key});

  @override
  State<WebSetMeeting> createState() => _WebSetMeetingState();
}

class _WebSetMeetingState extends State<WebSetMeeting> {
  String selectedTime = '9:00 AM';
  final controller = DateRangePickerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocConsumer<WriteVedioRequestBloc, BlocStates>(
            builder: (ctx, state) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopBar(clicked: 4),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .5,
                            alignment: Alignment.topRight,
                            child: Text(
                              "Schedule Meeting ",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(right: 30),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              width: size.width * .5,
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebAccessPage(
                                                  pageId: 0,
                                                )),
                                      );
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "Asset/images/Growlog color.png",
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebAccessPage(
                                                  pageId: 1,
                                                )),
                                      );
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "Asset/images/GrowTrack Color.png",
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebAccessPage(
                                                  pageId: 2,
                                                )),
                                      );
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "Asset/images/GrowMaster Color.png",
                                        )),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Select Date And Time",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(),
                                )),
                            const SizedBox(
                              height: 30,
                            ),

                            //calednder here
                            Expanded(
                              child: Container(
                                  color: Colors.grey,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SfDateRangePicker(
                                    backgroundColor:
                                        Colors.black.withOpacity(.2),
                                    headerStyle: DateRangePickerHeaderStyle(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                    monthCellStyle:
                                        DateRangePickerMonthCellStyle(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displaySmall),
                                    selectionShape:
                                        DateRangePickerSelectionShape.rectangle,
                                    controller: controller,
                                    initialSelectedDate: DateTime.now(),
                                    selectionTextStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RailWay'),
                                    selectionColor: Colors.amber,
                                    enablePastDates: false,
                                    todayHighlightColor: Colors.amber,
                                  )),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "Grow Master Availibility Date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.normal),
                                )),
                            ScheduleTimingsGrid(
                              fun: setTime,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    submit(context);
                                  },
                                  child: const Text("Submit")),
                            ),
                          ],
                        ))
                      ],
                    )),
                  ],
                ),
              ),
              if (state is Loading) const ProgressCircularIndicatorCustom()
            ],
          );
        }, listener: (ctx, state) {
          if (state is Sucessfull) {
            var snackBar = const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(successsnackbartext),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            var a =
                BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();

            BlocProvider.of<ReadVedioRequestBloc>(context)
                .readUserData(a.agentId as String)
                .then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebAccessPage(
                            pageId: 2,
                          )));
            });
          }

          if (state is Failure) {
            var snackBar = const SnackBar(
              duration: Duration(seconds: 2),
              content: Text(faliuresnackbartext),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }),
      ),
    ));
  }

  void setTime(String time) {
    selectedTime = time;
    print(selectedTime);
  }

  void submit(BuildContext context) {
    DateTime date = controller.selectedDate as DateTime;

// Parse the time string into a TimeOfDay object
    TimeOfDay time =
        TimeOfDay.fromDateTime(DateFormat('hh:mm a').parse(selectedTime));

// Combine the date and time to create a new DateTime object
    DateTime dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

    print(dateTime);
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    VedioRequestEntity vedioRequestEntity = VedioRequestEntity(
        dateTime: dateTime.toString(),
        updatedAt: DateTime.now().toString(),
        meetingpasscode: "");

    BlocProvider.of<WriteVedioRequestBloc>(context)
        .writeVedioRequesr(vedioRequestEntity, a.agentId as String);

//023-04-01 09:00:00.000
  }
}
