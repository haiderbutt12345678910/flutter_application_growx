import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/signIn.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/processpayment.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/constvar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/SubsCriptionPalnsBloc/readSubscriptionPlanbloc.dart';
import '../Widgets/footer.dart';

class Pricing extends StatelessWidget {
  const Pricing({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var subscriptionPlanEntity =
        BlocProvider.of<ReadSubscriptionPlanbloc>(context).readListLocall();

    var isUserSignedin =
        BlocProvider.of<IsUserLoggedInCubit>(context).isUserLoggedInLocall();
    if (!isUserSignedin) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WebSignIn()),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * .2,
                    ),
                    Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Get GrowX AI right now",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 28),
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Done waiting? Ready to join the Homegrown Revolution? Choose the subscription that is right for you and get going",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 26),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: double.infinity,
                        height: size.height * .7,
                        child: Row(
                          children: [
                            Expanded(
                              child: planCards("B", 0, basicPlanBtnTxt,
                                  subscriptionPlanEntity[0], context),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: planCards("S", 1, standardPlanBtnTxt,
                                  subscriptionPlanEntity[1], context),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: planCards("non", 2, premiumPlanBtnTxt,
                                  subscriptionPlanEntity[2], context),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: const Footer(),
                    )
                  ]),
                ),
              ),
              TopBar(clicked: 3)
            ],
          ),
        ),
      ),
    );
  }

  Widget planCards(String id, int index, String btnText,
      SubscriptionPlanEntity subscritionEntitys, BuildContext context) {
    SubscriptionPlanEntity subscritionEntity = subscritionEntitys;
    var list = [];
    late String plantitle;
    late final String title;
    late final String subtitle;
    if (id == "B") {
      list = basicList;
      plantitle = basicPlantitle;
      title = basicPlan;
      subtitle = basicFee;
    } else if (id == "S") {
      plantitle = standardPlantitle;
      list = standardList;
      title = standardPlan;
      subtitle = standardFee;
    } else {
      plantitle = premiumPlantitle;
      list = premiumList;

      title = premiumPlan;
      subtitle = premiumFee;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            trailing: const Icon(
              Icons.lightbulb,
              color: Colors.amber,
            ),
            title: Text(
              subscritionEntity.name as String,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 28),
            ),
            subtitle: Text(
              "${subscritionEntity.baseAmount as String}/perMonth",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.yellowAccent),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Text(
                      plantitle,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  for (int i = 0; i < subscritionEntity.optionList!.length; i++)
                    Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                subscritionEntity.optionList![i].option,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                subscritionEntity.optionList![i].isAvaialible
                                    ? Icons.check_circle
                                    : Icons.cancel_sharp,
                                color: subscritionEntity
                                        .optionList![i].isAvaialible
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            )
                          ],
                        )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          var a = BlocProvider.of<ReadUserCubit>(context)
                              .readUserDataLocall();
                          if (a.userSubscripsCritionEntity!.id ==
                              subscritionEntity.id) {
                            var snackBar = const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text("Alraedy Subscribed"),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProcessPayment(
                                        subscriptionPlanEntity:
                                            subscritionEntity,
                                      )),
                            );
                          }
                        },
                        child: Text(
                          btnText,
                          style: const TextStyle(fontSize: 12),
                        )),
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
// ListTile(
//                         subtitle: Text(
//                           subscritionEntity.optionList![i].option,
//                           style: Theme.of(context).textTheme.displaySmall,
//                         ),
//                         trailing: Icon(
//                           subscritionEntity.optionList![i].isAvaialible
//                               ? Icons.check_circle
//                               : Icons.cancel_sharp,
//                           color: subscritionEntity.optionList![i].isAvaialible
//                               ? Colors.green
//                               : Colors.red,
//                         ),
//                       )