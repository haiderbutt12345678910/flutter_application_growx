import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/localCubit/uerplantdataStatic.dart';

class WebPlantBtns extends StatefulWidget {
  final String text;
  final String id;
  const WebPlantBtns({super.key, required this.text, required this.id});

  @override
  State<WebPlantBtns> createState() => _WebPlantBtnsState();
}

class _WebPlantBtnsState extends State<WebPlantBtns> {
  int btn = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RailWay'),
                          backgroundColor:
                              btn == 0 ? Colors.amber : Colors.black,
                          side:
                              const BorderSide(width: 2, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          btn = 0;
                          if (widget.id == "wp") {
                            UserPlantStatic.waterPh = "L";
                          } else if (widget.id == "wt") {
                            UserPlantStatic.waterTemp = "L";
                          } else if (widget.id == "wv") {
                            UserPlantStatic.waterVolume = "L";
                          } else if (widget.id == "c") {
                            UserPlantStatic.co2ppm = "L";
                          } else if (widget.id == "h") {
                            UserPlantStatic.humidity = "L";
                          } else {
                            UserPlantStatic.tempOf = "L";
                          }
                        });
                      },
                      child: const Text("Low")),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontFamily: 'RailWay',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          backgroundColor:
                              btn == 1 ? Colors.amber : Colors.black,
                          side:
                              const BorderSide(width: 2, color: Colors.white)),
                      onPressed: () {
                        btn = 1;
                        //signup screen
                        setState(() {
                          if (widget.id == "wp") {
                            UserPlantStatic.waterPh = "H";
                          } else if (widget.id == "wt") {
                            UserPlantStatic.waterTemp = "H";
                          } else if (widget.id == "wv") {
                            UserPlantStatic.waterVolume = "H";
                          } else if (widget.id == "c") {
                            UserPlantStatic.co2ppm = "H";
                          } else if (widget.id == "h") {
                            UserPlantStatic.humidity = "H";
                          } else {
                            UserPlantStatic.tempOf = "H";
                          }
                        });
                      },
                      child: const Text("High")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



// Widget row(BuildContext buildContext, String text, String id) {
//     return Container(
//       width: double.infinity,
//       child: Row(
//         children: [
//           Expanded(
//               child: Container(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               text,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//           )),
//           Expanded(
//               child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               btn == 0 ? Colors.yellowAccent : Colors.black,
//                           side:
//                               const BorderSide(width: 2, color: Colors.white)),
//                       onPressed: () {
//                         print(btn);
//                         setState(() {
//                           btn = 0;
//                           if (id == "p") {
//                             phLEvel = "L";
//                           } else if (id == "t") {
//                             temprature = "L";
//                           } else {
//                             waterLeveL = "L";
//                           }
//                         });
//                       },
//                       child: const Text("Low")),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               btn == 1 ? Colors.yellowAccent : Colors.black,
//                           side:
//                               const BorderSide(width: 2, color: Colors.white)),
//                       onPressed: () {
//                         btn = 1;
//                         //signup screen
//                         setState(() {
//                           if (id == "p") {
//                             phLEvel = "H";
//                           } else if (id == "t") {
//                             temprature = "H";
//                           } else {
//                             waterLeveL = "H";
//                           }
//                         });
//                       },
//                       child: const Text("High")),
//                 ),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
