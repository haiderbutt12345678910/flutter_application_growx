import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/accessScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/plantInfo.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ReadUserCubit>(context).readUserData();

    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          endDrawer: Drawer(
            width: 250,
            child: Stack(
              children: [
                const BackGroundGradientContainer(),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Asset/images/logo.png"))),
                      ),
                      Expanded(
                          child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                var user =
                                    BlocProvider.of<ReadUserCubit>(context)
                                        .readUserDataLocall();

                                if (user.userplantEntity!.plantationDate !=
                                    null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AccessScreen()),
                                  );
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const PlantInfo(
                                                id: 1,
                                              )));
                                }
                              },
                              title: Text(
                                "ACCESS",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              subtitle: const Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "GROW LOG",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              subtitle: const Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "GROW TRACKING",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              subtitle: const Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "GROW MASTER",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              subtitle: const Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           const ContactUsOverView()),
                                // );
                              },
                              title: Text(
                                "CONTACT US",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              subtitle: const Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          body: BlocBuilder<ReadUserCubit, BlocStates>(builder: (ctx, state) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Asset/images/leaf.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  height: 30,
                  child: IconButton(
                      onPressed: () {
                        //open darwer
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                ),
                if (state is Loading) const ProgressCircularIndicatorCustom()
              ],
            );
          })),
    );
  }
}
