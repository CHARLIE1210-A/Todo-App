class Task {
  int? id;
  int? isCompleted;
  int? remind;
  String? title;
  String? date;
  String? desc;
  String? startTime;
  String? endTime;
  String? repeat;

  Task({
    this.id,
    this.isCompleted,
    this.remind,
    this.title,
    this.desc,
    this.date,
    this.startTime,
    this.endTime,
    this.repeat,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        isCompleted: json["isCompleted"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        repeat: json["repeat"],
        remind: json["remind"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "isCompleted": isCompleted,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "repeat": repeat,
        "remind": remind,
      };
}
