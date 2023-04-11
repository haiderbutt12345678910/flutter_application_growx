import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/readEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/Emial/createEmail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';

class EmailOverView extends StatefulWidget {
  const EmailOverView({super.key});

  @override
  State<EmailOverView> createState() => _EmailOverViewState();
}

class _EmailOverViewState extends State<EmailOverView> {
  @override
  void initState() {
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    String agentId = a.agentId as String;
    BlocProvider.of<ReadEmailsCubit>(context).readEmails(agentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.teal,
            label: Text(
              "New Mail",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateEmail()),
              );
            }),
        body: const BackGroundGradientContainer());
  }
}
//Stack(
  //      children: [
          

          //     BlocBuilder<ReadEmailsCubit, BlocStates>(
          //       builder: (ctx, state) {
          //         var list =
          //             BlocProvider.of<ReadEmailsCubit>(context).readEmailsLocall();
          //         return Stack(
          //           children: [
          //             if (list.isEmpty)
          //               Container(
          //                   alignment: Alignment.center,
          //                   margin: const EdgeInsets.symmetric(
          //                       horizontal: 20, vertical: 5),
          //                   width: double.infinity,
          //                   height: a.height,
          //                   child: Text(
          //                     "Inbox Is Empty!",
          //                     style: Theme.of(context).textTheme.titleLarge,
          //                   )),
          //             if (list.isNotEmpty)
          //               Container(
          //                 color: Colors.black,
          //                 margin: const EdgeInsets.symmetric(
          //                     horizontal: 20, vertical: 5),
          //                 width: double.infinity,
          //                 height: a.height,
          //                 child: ListView.builder(
          //                     itemCount: list.length,
          //                     itemBuilder: (ctx, i) {
          //                       return Card(
          //                         color: Colors.white,
          //                         child: ListTile(
          //                           leading: const CircleAvatar(
          //                             backgroundColor: Colors.black,
          //                             backgroundImage: AssetImage(
          //                               "Asset/images/leaf.png",
          //                             ),
          //                           ),
          //                           title: Text(
          //                               overflow: TextOverflow.ellipsis,
          //                               maxLines: 1,
          //                               list[i].reply!.isEmpty
          //                                   ? list[i].email as String
          //                                   : list[i].reply as String,
          //                               style: Theme.of(context)
          //                                   .textTheme
          //                                   .titleSmall!
          //                                   .copyWith(color: Colors.black)),
          //                           subtitle: Text(list[i].createdAt.toString()),
          //                         ),
          //                       );
          //                     }),
          //               ),
          //             if (state is Loading) const ProgressCircularIndicatorCustom()
          //           ],
          //       );
          //    },
          // )
      //  ],
     // ),