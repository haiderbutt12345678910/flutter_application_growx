import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/SubsCriptionPalnsBloc/readSubscriptionPlanbloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/SubscriptionScreens/subscriptiondeatls.dart';
import 'package:flutter_application_growx/constvar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard({super.key});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  List<bool> isOpened = [false, false, false];

  @override
  void initState() {
    if (BlocProvider.of<ReadSubscriptionPlanbloc>(context)
        .readListLocall()
        .isEmpty) {
      BlocProvider.of<ReadSubscriptionPlanbloc>(context).readPlans();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadSubscriptionPlanbloc, BlocStates>(
      builder: (ctx, state) {
        List<SubscriptionPlanEntity> subscriptionPlanEntity =
            BlocProvider.of<ReadSubscriptionPlanbloc>(context).readListLocall();

        return Stack(
          children: [
            if (state is Sucessfull)
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      planCards(
                          "B", 0, basicPlanBtnTxt, subscriptionPlanEntity[0]),
                      const SizedBox(
                        height: 8,
                      ),
                      planCards("S", 1, standardPlanBtnTxt,
                          subscriptionPlanEntity[1]),
                      const SizedBox(
                        height: 8,
                      ),
                      planCards("non", 2, premiumPlanBtnTxt,
                          subscriptionPlanEntity[2]),
                    ],
                  ),
                ),
              ),
            if (state is Loading)
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.teal,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              )
          ],
        );
      },
    );
  }

  Widget planCards(String id, int index, String btnText,
      SubscriptionPlanEntity subscritionEntitys) {
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
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < isOpened.length; i++) {
                      if (index == i) {
                        if (isOpened[index] == false) {
                          isOpened[index] = true;
                        } else {
                          isOpened[index] = false;
                        }
                      } else {
                        isOpened[i] = false;
                      }
                    }
                  });
                },
                icon: Icon(
                  Icons.lightbulb,
                  color: isOpened[index] ? Colors.yellowAccent : Colors.grey,
                  size: 50,
                )),
            title: Text(
              subscritionEntity.name as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "${subscritionEntity.baseAmount as String}/perMonth",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.yellowAccent),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (isOpened[index])
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Text(
                      plantitle,
                      style: Theme.of(context).textTheme.titleSmall,
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
                        child: ListTile(
                          subtitle: Text(
                            subscritionEntity.optionList![i].option,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          trailing: Icon(
                            subscritionEntity.optionList![i].isAvaialible
                                ? Icons.check_circle
                                : Icons.cancel_sharp,
                            color: subscritionEntity.optionList![i].isAvaialible
                                ? Colors.green
                                : Colors.red,
                          ),
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
                              duration: Duration(seconds: 2),
                              content: Text("Already Subsribed"),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentProcessMobile(
                                        subscriptionPlanEntity:
                                            subscritionEntity,
                                      )),
                            );
                          }
                        },
                        child: Text(
                          btnText,
                          style: const TextStyle(fontSize: 15),
                        )),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
