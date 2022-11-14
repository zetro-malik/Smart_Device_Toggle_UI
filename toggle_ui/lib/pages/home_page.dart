import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toggle_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding
  double horizontalPadding = 40;
  double verticalPadding = 25;

  //smart devices
  List mySmartDevice = [
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  powerchange(val, index) {
    setState(() {
      mySmartDevice[index][2] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    "lib/icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  //account icon
                  Icon(Icons.person, size: 45, color: Colors.grey[800])
                ],
              ),
            ),
            const SizedBox(height: 20),

            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome Home,"),
                  Text(
                    "ZEESHAN MALIK",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            const SizedBox(height: 25),

            //smart device + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices"),
            ),

            Expanded(
                child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(25),
              itemCount: mySmartDevice.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return smartDeviceBox(
                  name: mySmartDevice[index][0],
                  iconPath: mySmartDevice[index][1],
                  on: mySmartDevice[index][2],
                  onChanged: (p0) => powerchange(p0, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
