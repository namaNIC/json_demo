class Student {
  Student(
      {this.id,
      this.name,
      this.score,
      required this.isPass,
      this.hobbies,
      this.physics,
      this.results});

  String? id;
  String? name;
  num? score;
  bool isPass = false;
  List<String>? hobbies;
  StudentPhysic? physics;
  List<WeeklyResult>? results;

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        id: parsedJson['id'],
        name: parsedJson['name'],
        isPass: parsedJson['isPass'] ?? false,
        hobbies: List<String>.from(parsedJson["hobbies"].map((x) => x)),
        physics: StudentPhysic.fromJson(parsedJson["physics"]),
        results: List<WeeklyResult>.from(parsedJson['weekly_test_result']
            .map((x) => WeeklyResult.fromJson(x))),
        score: double.tryParse(
          parsedJson['score'],
        ));
  }
}

class StudentPhysic {
  StudentPhysic({this.height, this.weight});
  num? height;
  num? weight;

  factory StudentPhysic.fromJson(Map<String, dynamic> parsedJson) {
    return StudentPhysic(
        height: parsedJson["height"], weight: parsedJson["weight"]);
  }
}

class WeeklyResult {
  WeeklyResult({this.day, this.score});

  String? day;
  num? score;

  factory WeeklyResult.fromJson(Map<String, dynamic> parsedJson) {
    return WeeklyResult(day: parsedJson['day'], score: parsedJson['score']);
  }
}
