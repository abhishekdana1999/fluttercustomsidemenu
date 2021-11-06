import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DasboardScreen());
  }
}

class DasboardScreen extends StatefulWidget {
  DasboardScreen({Key? key}) : super(key: key);

  @override
  _DasboardScreenState createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "😊",
                                style: TextStyle(fontSize: 30),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 0;
                                        print(activeIndex);
                                      });
                                    },
                                    child: _buildContainer(Icons.home_outlined,
                                        activeIndex == 0 ? true : false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 1;
                                        print(activeIndex);
                                      });
                                    },
                                    child: _buildContainer(
                                        Icons.explore_outlined,
                                        activeIndex == 1 ? true : false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 2;
                                        print(activeIndex);
                                      });
                                    },
                                    child: _buildContainer(Icons.person_outline,
                                        activeIndex == 2 ? true : false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeIndex = 3;
                                        print(activeIndex);
                                      });
                                    },
                                    child: _buildContainer(
                                        Icons.settings_outlined,
                                        activeIndex == 3 ? true : false),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  _buildContainer(Icons.logout_outlined, false),
                                ],
                              ),
                            ),
                          ]),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.deepPurple,
                      child: Center(
                          child: Text(
                              activeIndex == 0
                                  ? "Home"
                                  : activeIndex == 1
                                      ? "Explore"
                                      : activeIndex == 2
                                          ? "Profile"
                                          : "Settings",
                              style: GoogleFonts.nunito(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ))),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildContainer(value, isActive) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color:
            isActive ? Colors.deepPurpleAccent.withOpacity(0.2) : Colors.white,
        border: isActive
            ? Border.all(width: 0, color: Colors.transparent)
            : Border.all(color: Colors.black.withOpacity(.07)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Icon(
        value,
        size: 24,
        color: isActive ? Colors.deepPurpleAccent : Colors.black26,
      )),
    );
  }
}
