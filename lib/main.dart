import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/project.dart';
import 'package:solocoding2019_base/view/circlenetworkimage.dart';
import 'package:solocoding2019_base/view/projecttilewidget.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SoloCodingDashBoard();
}

class SoloCodingDashBoard extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: '나코딩한다', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('나 코딩한다 Flutter 편'), // app bar title
        ),
        body: Center(
          child: ProjectListWidget(), // center text
        ),
      ),
    );
  }
}

class ProjectListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProjectListState();
}

class ProjectListState extends State<ProjectListWidget> {
  List<Project> projectList;

  @override
  void initState() {
    initProjectList();
    super.initState();
  }

  void initProjectList() async {
    projectList = List();
    Stream<Project> streamProjectList = await getProjects();
    streamProjectList
        .listen((project) => setState(() => projectList.add(project)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          projectList.map((project) => ProjectTileWidget(project)).toList(),
    );
  }
}
