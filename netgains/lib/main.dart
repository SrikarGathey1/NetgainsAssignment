import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueAccent,
      fontFamily: 'Oswald',
    ),
  ));
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "Janus",
              style: TextStyle(
                  fontFamily: "pacifico",
                  color: Colors.orange.shade400,
                  fontSize: 40),
            ),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyApp()));
            },
          ),
          ListTile(
            title: Text("To-do-List"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => _ToDo()));
            },
          ),
          ListTile(
            title: Text("Pomodoro Timer"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => _Pomodoro()));
            },
          ),
          ListTile(
            title: Text("Notes"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => _Notes()));
            },
          ),
          ListTile(
            title: Text("Settings"),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Janus",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.orange.shade400),
              )),
        ),
        body: Center(
          child: Text("Home Page"),
        ),
        drawer: MyDrawer());
  }
}

class _ToDo extends StatefulWidget {
  @override
  _ToDoPage createState() => _ToDoPage();
}

class _Pomodoro extends StatefulWidget {
  @override
  _PomodoroPage createState() => _PomodoroPage();
}

class _Notes extends StatefulWidget {
  @override
  _NotesPage createState() => _NotesPage();
}

class _ToDoPage extends State<_ToDo> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Janus",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.orange.shade400),
              )),
        ),
        body: Center(
          child: Text("To-Do-List"),
        ),
        drawer: MyDrawer());
  }
}

class _PomodoroPage extends State<_Pomodoro> with TickerProviderStateMixin {
  String second = "10";
  var seconds = ["10", "20", "30"];
  var modes = ["Pomodoro", "Short Break", "Long Break"];
  double progress = 1.0;
  bool isPlaying = false;
  String dropdown = "Pomodoro";
  String buttonText = "Play/Pause";
  String resetButton = "Reset Timer";

  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    final minutes = (count.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (count.inSeconds % 60).toString().padLeft(2, '0');
    return "${minutes}:${seconds}";
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Janus",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.orange.shade400),
              )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Column(children: [
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Pomodoro Timer",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40,
                      color: Colors.orange.shade300),
                )),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Enhance your productivity",
                  style: TextStyle(fontFamily: "pacifico", fontSize: 20.0)),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 6,
                          color: Colors.orange.shade400,
                        ),
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) => Text(
                                countText,
                                style: TextStyle(fontSize: 60),
                              )),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(top: 40.0, bottom: 40.0, left: 100.0),
                    child: Container(
                        alignment: Alignment.center,
                        child:
                            SizedBox(width: 200, child: Text("Select Mode:")))),
                SizedBox(
                  width: 200,
                  child: DropdownButton(
                    value: dropdown,
                    underline: SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: modes.map((String modes) {
                      return DropdownMenuItem(
                        value: modes,
                        child: Text(modes),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.reset();
                      setState(() {
                        isPlaying = false;
                      });
                      setState(() {
                        dropdown = newValue!;
                        if (controller.isAnimating == false) {
                          if (newValue == "Pomodoro") {
                            controller.duration = Duration(seconds: 1500);
                          } else {
                            if (newValue == "Short Break") {
                              controller.duration = Duration(seconds: 300);
                            } else {
                              controller.duration = Duration(seconds: 900);
                            }
                          }
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary: Colors.orange.shade400),
                          onPressed: () {
                            if (controller.isAnimating) {
                              controller.stop();
                              setState(() {
                                isPlaying = false;
                              });
                            } else {
                              controller.reverse(
                                  from: controller.value == 0
                                      ? 1.0
                                      : controller.value);
                              setState(() {
                                isPlaying = true;
                              });
                            }
                          },
                          child: Text(buttonText))),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        child: Text("Reset Timer"),
                        onPressed: () {
                          controller.reset();
                          setState(() {
                            isPlaying = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Colors.orange.shade400),
                      )),
                )
              ],
            )
          ]),
        ])),
        drawer: MyDrawer());
  }
}

class _NotesPage extends State<_Notes> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Janus",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.orange.shade400),
              )),
        ),
        body: Center(
          child: Text("Notes"),
        ),
        drawer: MyDrawer());
  }
}
