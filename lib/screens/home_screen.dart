import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice33_hw2/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Widget topButtonMaker({
    required IconData icon,
    double size = 28,
    required void Function() function,
  }) {
    return IconButton(
        onPressed: function,
        icon: Icon(
          icon,
          color: ColorsClass.white,
          size: size,
        ));
  }

  Widget plusMinusButtonMaker(
      {required IconData icon, required void Function() function}) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorsClass.grey, width: 2)),
      child: IconButton(
          onPressed: function,
          icon: Icon(
            icon,
            color: ColorsClass.white,
            size: 45,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.black,
      appBar: AppBar(
        backgroundColor: ColorsClass.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            topButtonMaker(
              icon: Icons.info_rounded,
              function: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            topButtonMaker(
              icon: Icons.settings,
              function: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            topButtonMaker(
              icon: Icons.restart_alt_rounded,
              size: 31,
              function: () {
                setState(() {
                  _counter = 0;
                });
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Transform.translate(
          offset: const Offset(0, -47),
          child: Center(
            child: Text(
              _counter.toString().padLeft(2, "0"),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 2.6,
                  color: ColorsClass.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 33),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  const Text(
                    "By Abdusalom",
                    style: TextStyle(fontSize: 23, color: ColorsClass.white),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        plusMinusButtonMaker(
                          icon: Icons.add,
                          function: () {
                            setState(() {
                              _counter++;
                              if (_counter == 100) {
                                _counter = 0;
                              }
                            });
                          },
                        ),
                        plusMinusButtonMaker(
                          icon: CupertinoIcons.minus,
                          function: () {
                            setState(() {
                              if (_counter > 0) {
                                _counter--;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
