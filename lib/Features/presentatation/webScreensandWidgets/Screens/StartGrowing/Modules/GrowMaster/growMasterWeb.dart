import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/Modules/GrowMaster/scheduleMeeting.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/Modules/GrowMaster/sendEmails.dart';

import '../../../../../screens/Contact Us/LiveChat/startLiveChat.dart';

class GrowMasterWeb extends StatelessWidget {
  const GrowMasterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      //    navigate to email
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebSendEmails()),
                      );
                    },
                    subtitle: Text(
                      "Contact Us With Email To Get Resposnse with in 24 to 48 hours",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 20),
                    ),
                    title: Text(
                      "EMAIL",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24),
                    ),
                    leading: const Icon(
                      Icons.mail,
                      color: Colors.amber,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      //    navigate to email
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartLiveChat()),
                      );
                    },
                    subtitle: Text(
                      "Our Team Is Online 24/7 for a Live Chat",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 20),
                    ),
                    title: Text(
                      "Live Chat",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24),
                    ),
                    leading: const Icon(
                      Icons.chat,
                      color: Colors.amber,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      //    navigate to Veiod schduling
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WebSetMeeting()),
                      );
                    },
                    subtitle: Text(
                      "Schedule a Vedio Meeting with our expert",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 20),
                    ),
                    title: Text(
                      "Schedule Vedio Call",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24),
                    ),
                    leading: const Icon(
                      Icons.video_call_rounded,
                      color: Colors.amber,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: size.height * .7,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Asset/webimages/avatar.png"))),
        ))
      ],
    );
  }
}
