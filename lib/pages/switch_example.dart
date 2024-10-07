// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});
  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}
class _SwitchExampleState extends State<SwitchExample> {
  //track the current state of switch
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text(
          'Switch Example!',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enable Dark Mode : ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

            //switch widget to toggle dark mode
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value; //updates the state with new value
                });
              },
              activeColor: Colors.black26,
              activeTrackColor: Colors.black,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _isSwitched ? 'Dark Mode is ON' : 'Dark Mode is OFF',
              style: TextStyle(
                  fontSize: 18,
                  color:
                      _isSwitched ? Colors.grey[600] : Colors.deepOrangeAccent),
            ),
            SizedBox(
              height: 20,
            ),
            //Displaying an icon based on switch state
            Icon(
              _isSwitched ? Icons.nightlight_round : Icons.wb_sunny,
              color: _isSwitched ? Colors.grey[600] : Colors.orange,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
