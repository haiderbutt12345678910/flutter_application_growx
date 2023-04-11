import 'package:flutter/material.dart';

class Modules extends StatelessWidget {
  final String url;
  final String heading;
  final String subHeading;
  final String bg;
  const Modules(
      {super.key,
      required this.url,
      required this.heading,
      required this.subHeading,
      required this.bg});

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;
    return desktopView(context, a.width);
  }

  Widget desktopView(BuildContext context, double a) {
    return bg == "02"
        ? Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bg,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 160)
                                .copyWith(color: Colors.white.withOpacity(.4)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Text(
                            heading,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 46)
                                .copyWith(color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            subHeading,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontFamily: 'RailWay', fontSize: 36),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bg,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 160)
                                .copyWith(color: Colors.white.withOpacity(.6)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Text(
                            heading,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 40)
                                .copyWith(color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            subHeading,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontFamily: 'RailWay', fontSize: 36),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          );
  }
}
