import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/footer.dart';

class Staff extends StatelessWidget {
  Staff({super.key});
  final names = [
    ["Add Name Here", "CEO"],
    ["Add Name Here", "CTO"],
    ["Add Name Here", "CMO"],
    ["Add Name Here", "COO"]
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 4; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 70,
                      // backgroundImage: AssetImage("Asset/images/Profile.png"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(names[i][0],
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 28)),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      names[i][1],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.amber, fontSize: 26),
                    )
                  ],
                ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: const Footer(),
        )
      ],
    );
  }
}
