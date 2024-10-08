import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/components/popups/warning_dialog.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String _addiction = "";
  DateTime _date = DateTime.now();

  Future<void> _navigateToHome(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Icon(Icons.search, size: 100)),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Welcome to Addiction Beater! We're so glad you joined us, enter an addiction you would like to beat to begin:",
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: TextField(
              onChanged: (value) => {_addiction = value},
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Addiction..."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date) {
                  _date = date;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: TextButton(
              onPressed: () async {
                if (_addiction.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const MyWarningDialog(
                          title: "Invalid Addiction",
                          description:
                              "Sorry, your addiction is invalid. You must enter something to continue.",
                        );
                      });
                } else if (_date.isAfter(DateTime.now())) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const MyWarningDialog(
                          title: "Invalid Addiction",
                          description:
                              "Sorry, you cannot set the start date after the current date.",
                        );
                      });
                } else {
                  await Provider.of<AddictionDatabase>(context, listen: false)
                      .addAddiction(_addiction, _date);
                  _navigateToHome(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 18), // Padding inside the button
              ),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 18, // Text size
                        fontFamily: "Arial"),
                  ),
                  SizedBox(width: 8), // Space between text and icon
                  Icon(
                    Icons.arrow_forward, // Arrow icon
                    color: Colors.white, // Icon color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
