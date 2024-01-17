// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;

  bool isLast;
  final String text;
  StepperComponent({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.isLast = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return Expanded(
      child: Column(
        children: [
          Text('$text '),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: currentIndex >= index ? Colors.green : Colors.black12,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: index >= currentIndex ? Colors.white : Colors.green,
                    border: Border.all(
                        color: currentIndex >= index
                            ? Colors.green
                            : Colors.black12,
                        width: 2),
                  ),
                  child: Center(
                      child: currentIndex <= index
                          ? Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: currentIndex == index
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            )
                          : const Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color:
                      currentIndex >= index + 1 ? Colors.green : Colors.black12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
