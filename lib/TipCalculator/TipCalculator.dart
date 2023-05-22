import 'package:flutter/foundation.dart';
import 'package:tipsy_calculator/TipCalculator/CustomTip.dart';
import 'package:tipsy_calculator/TipCalculator/Result.dart';
import 'package:tipsy_calculator/TipCalculator/TipBox.dart';
import 'package:tipsy_calculator/model/bill.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  Bill bill = Bill(totalAmount: 0, tipAmount: 10, noOfPeople: 2);
  List<int> tips = [10, 15, 20];

  calculateTip(double percentage) {
    bill.tipAmount = bill.totalAmount * percentage / 100;
    setState(() {});
  }

  openCustomTip(context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        isScrollControlled: true,
        builder: (builder) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CustomTip(bill: bill));
        }).then((value) => {setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Container of Full Screen in which I set the full screen background color.

          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                //border: Border.all(width: 10,color: Colors.red),
              ),
              padding: const EdgeInsets.only(top: 0.0, right: 40, left: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Camera Icon Button

                    IconButton(
                        padding: const EdgeInsets.only(top: 55.0, left: 300.0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: Colors.black,
                        )),

                    //Menu Item Button

                    IconButton(
                        padding: const EdgeInsets.only(top: 0.0, right: 300.0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 35,
                        )),

                    Padding(
                      padding: const EdgeInsets.only(top: 450, right: 180),
                      child: Text("TOTAL AMOUNT",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.pink[300])),
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        ...tips.map((tip) => TipBox(
                            isSelected:
                                bill.tipAmount == bill.totalAmount * tip / 100,
                            text: '$tip%',
                            onTap: () {
                              calculateTip(tip.toDouble());
                            })),
                        TipBox(
                            isSelected: true,
                            text: "Custom Tip",
                            onTap: () {
                              openCustomTip(context);
                            }),
                      ],
                    ),

                    // Building and styling of Split Function
                    Padding(
                      padding: const EdgeInsets.only(top: 500, right: 220),
                      child: Text("SPLIT",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.pink[300])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.only(top: 300),
                            onPressed: () => {
                                  setState(() {
                                    bill.noOfPeople--;
                                  })
                                },
                            icon: Icon(Icons.remove_circle_outline,
                                size: 24, color: Colors.pink[300])),
                        Text(bill.noOfPeople.toString(),
                            style: Theme.of(context).textTheme.headline4),
                        IconButton(
                            padding: const EdgeInsets.only(top: 300),
                            onPressed: () => {
                                  setState(() {
                                    bill.noOfPeople++;
                                  })
                                },
                            icon: Icon(Icons.add_circle_outline,
                                size: 24, color: Colors.pink[300])),
                      ],
                    ),
                    ResultTip(
                      bill: bill,
                    ),
                  ])),
    );
  }
}
