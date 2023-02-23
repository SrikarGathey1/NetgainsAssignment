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

class _PomodoroPage extends State<_Pomodoro> {
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
          child: Text("Pomodoro Timer"),
        ),
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
