import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  SharedPreferences? prefs;

  int visitTime = 0;

  setvisit() async {
    setState(() {
      visitTime++;
    });
    await prefs!.setInt('uservisit', visitTime);
  }

  @override
  void initState() {
    getstate();
  }

  getstate() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      visitTime = prefs!.getInt('uservisit') ?? 0;
    });
    setvisit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (visitTime % 5 == 0) ? Colors.blue : Colors.white,
      body: Center(
          child: Text(
        "You have $visitTime time Visit  ",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
    );
  }
}


