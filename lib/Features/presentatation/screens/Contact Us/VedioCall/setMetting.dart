import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/readVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/writeVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/ContactUsWidgets/vedioChat/sceduleTimins.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../constvar.dart';

class SetMeeting extends StatefulWidget {
  const SetMeeting({super.key});

  @override
  State<SetMeeting> createState() => _SetMeetingState();
}

class _SetMeetingState extends State<SetMeeting> {
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
        body: Stack(
      children: [
        const BackGroundGradientContainer(),
        BlocConsumer<WriteVedioRequestBloc, BlocStates>(builder: (ctx, state) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Heading(
                          heading: "Grow Master",
                          subHeading: "Scheduling A Meeting"),

                      const SizedBox(
                        height: 30,
                      ),

                      Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            "Select Date And Time",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.normal),
                          )),
                      const SizedBox(
                        height: 30,
                      ),

                      //calednder here
                      Container(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 200,
                          child: SfDateRangePicker(
                            backgroundColor: Colors.black.withOpacity(.2),
                            headerStyle: DateRangePickerHeaderStyle(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
                            monthCellStyle: DateRangePickerMonthCellStyle(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall),
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
                      const SizedBox(
                        height: 30,
                      ),
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
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              submit(context);
                            },
                            child: const Text("Submit")),
                      ),
                    ],
                  ),
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
              Navigator.of(context).pop();
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
        })
      ],
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
