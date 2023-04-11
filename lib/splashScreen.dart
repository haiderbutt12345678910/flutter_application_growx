import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/iniitialScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/homeScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/landingPage.dart';
import 'package:flutter_application_growx/errorScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/presentatation/bloc/SubsCriptionPalnsBloc/readSubscriptionPlanbloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Asset/images/leaf.png"), fit: BoxFit.cover)),
      ),
    );
  }

  void navigate(BuildContext context) async {
    await BlocProvider.of<RaedVedioListCubit>(context)
        .readVedioList()
        .then((value) async {
      var readVedioLocall =
          BlocProvider.of<RaedVedioListCubit>(context).readVedioListLocall();
      if (readVedioLocall.isNotEmpty) {
        await BlocProvider.of<ReadSubscriptionPlanbloc>(context)
            .readPlans()
            .then((value) async {
          await BlocProvider.of<ReadAgentListCubit>(context)
              .readAgnets()
              .then((value) {
            var readAgentList =
                BlocProvider.of<ReadAgentListCubit>(context).readListLocall();

            if (readAgentList.isNotEmpty) {
              BlocProvider.of<IsUserLoggedInCubit>(context)
                  .isUserLoggedIn()
                  .then((value) {
                var isLoggedIn = BlocProvider.of<IsUserLoggedInCubit>(context)
                    .isUserLoggedInLocall();
                if (isLoggedIn == true) {
                  BlocProvider.of<ReadUserCubit>(context)
                      .readUserData()
                      .then((value) {
                    if (kIsWeb) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LandigPage()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    }
                  });
                } else {
                  if (kIsWeb) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandigPage()),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InitialScreen()),
                    );
                  }
                }
              });
            } else {}
          });
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ErrorScreen()),
        );
      }
    });
  }
}
