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
  List<int> tips = [10, 15, 20, 25];

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
      width: 400,
      height: 800,
      decoration: const BoxDecoration(
        color: Colors.white,
        //border: Border.all(width: 10,color: Colors.red),
      ),
      padding: const EdgeInsets.only(top: 24, right: 40, left: 40),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Camera Icon
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.camera_alt,
                size: 35,
                color: Colors.black,
              ),
            ),

            //Icon Button
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, color: Colors.white)),

            TextField(
              onChanged: (value) => {
                setState(() {
                  bill.totalAmount = double.parse(value);
                })
              },
              style: Theme.of(context).textTheme.headline4,
              decoration: InputDecoration(
                  labelText: "Enter Bill Amount",
                  prefixText: "\$ ",
                  prefixStyle: Theme.of(context).textTheme.headline4,
                  labelStyle:
                      const TextStyle(color: Colors.grey, fontSize: 18)),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 150),
              child: Text("Choose Tip",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            Wrap(
              spacing: 20,
              children: [
                ...tips.map((tip) => TipBox(
                    isSelected: bill.tipAmount == bill.totalAmount * tip / 100,
                    text: '$tip%',
                    onTap: () {
                      calculateTip(tip.toDouble());
                    })),
                TipBox(
                    isSelected: false,
                    text: "Custom Tip",
                    onTap: () {
                      openCustomTip(context);
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, right: 220),
              child: Text("Split",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.pink[300])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
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
          ]),
    ));
  }
}
