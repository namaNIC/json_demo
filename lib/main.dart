import 'package:flutter/material.dart';
import 'package:json_demo/models/students_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student? student;

  @override
  void initState() {
    loadStudent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/student.json');
  }

  Future loadStudent() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      student = Student.fromJson(jsonResponse);
    });
  }

  String sum(num a, num b) {
    return (a + b).toString();
  }
  

  @override
  Widget build(BuildContext context) {
    num? monScore = student?.results
        ?.firstWhere((WeeklyResult element) => element.day == 'Mon')
        .score;

    num? tueScore = student?.results
        ?.firstWhere((WeeklyResult element) => element.day == 'Tue')
        .score;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name is ${student?.name}',
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Id is ${student?.id}',
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Score is ${student?.score?.toStringAsFixed(2)}',
            ),
            SizedBox(
              height: 40,
            ),
            Text('Student is ${(student?.isPass ?? false) ? 'Pass' : 'Fail'}'),
            SizedBox(
              height: 40,
            ),
            Text('Number of Hobbies is ${student?.hobbies?.length ?? 0}'),
            SizedBox(
              height: 40,
            ),
            Text('${student?.name}\'s height is ${student?.physics?.height}'),
            SizedBox(
              height: 40,
            ),
            Text('${student?.name}\'s weight is ${student?.physics?.weight}'),
            SizedBox(
              height: 40,
            ),
            Text(
                'Score on monday is ${student?.results?.firstWhere((WeeklyResult element) => element.day == 'Mon').score}'),
            Text(
                'Score on tue is ${student?.results?.firstWhere((WeeklyResult element) => element.day == 'Tue').score}'),

            Text(
                'sum of score on monday and tue is ${sum(monScore ?? 0, tueScore ?? 0)}'),

            Text('score for full week is'),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: student?.results?.length ?? 0,
            //     itemBuilder: (_, int i) {
            //       return Center(
            //           child: Text(
            //               'Score on ${student?.results?[i].day} is ${student?.results?[i].score}'));
            //     }),
            Expanded(
                child: ListView.builder(
                    itemCount: student?.hobbies?.length ?? 0,
                    itemBuilder: (_, int i) {
                      return Center(child: Text('${student?.hobbies?[i]}'));
                    }))
          ],
        ),
      ),
    );
  }
}
