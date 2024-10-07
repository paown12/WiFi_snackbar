// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'Wi-Fi Connection',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: WifiSnackbar(),
        ),
      ),
    );
  }
}

class WifiSnackbar extends StatelessWidget {
  //simulate wifi connection check
  bool isConnectedToWiFi = true; //You can modify this
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //show a snackbar based on wifi status
        if (isConnectedToWiFi) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.wifi,
                  color: Colors.white,
                ), //success icon
                SizedBox(
                  width: 10,
                ),
                Text('Connected to Wi-Fi!')
              ],
            ),
            backgroundColor: Colors.green, //green for success connection
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.wifi_off,
                  color: Colors.white,
                ), //error icon
                SizedBox(
                  width: 10,
                ),
                Text('No Wi-Fi Connection!')
              ],
            ),
            backgroundColor: Colors.red, //red for no connection
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            action: SnackBarAction(
                label: 'Retry',
                textColor: Colors.yellow,
                onPressed: () {
                  //retry.. just create another snackbar
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ), //retry icon
                        SizedBox(
                          width: 10,
                        ),
                        Text('Retrying.....')
                      ],
                    ),
                    backgroundColor:
                        Colors.orange, //orange for retry connection
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ));
                }),
          ));
        }
      },
      child: Text('Check Wi-Fi Connection'),
    );
  }
}
