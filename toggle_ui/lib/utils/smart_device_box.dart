import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class smartDeviceBox extends StatelessWidget {
  final String name;
  final String iconPath;
  final bool on;
  final void Function(bool)? onChanged;

  const smartDeviceBox(
      {super.key,
      required this.name,
      required this.iconPath,
      required this.on,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: on ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: on ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: on ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(value: on, onChanged: onChanged),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
