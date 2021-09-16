class HomeData {
  Progress excutionProgress, performanceProgress;
  StrategyStatus strategyStatus;
  DateTime startDate, endDate;
  String strategyTitle;
  String professionTitle;
  List<Objective> objectives;

  HomeData({
    this.endDate,
    this.excutionProgress,
    this.performanceProgress,
    this.professionTitle,
    this.startDate,
    this.strategyStatus,
    this.strategyTitle,
    this.objectives,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    final int intStartDate = int.tryParse(json['startDate']);
    final DateTime startDate =
        DateTime.fromMillisecondsSinceEpoch(intStartDate);

    final int intEndDate = int.tryParse(json['endDate']);
    final DateTime endDate = DateTime.fromMillisecondsSinceEpoch(intEndDate);

    final jsonObjectiveLst = json['objectives'] as List;
    List<Objective> objectives = [];

    for (var jsnObjective in jsonObjectiveLst) {
      objectives.add(Objective.fromJson(jsnObjective));
    }

    return HomeData(
      strategyTitle: json['title'],
      strategyStatus: json['strategyStatus'] != null
          ? StrategyStatus.fromJson(json['strategyStatus'])
          : null,
      startDate: startDate,
      endDate: endDate,
      excutionProgress: json['executionProgress'] != null
          ? Progress.fromJson(json['executionProgress'])
          : null,
      performanceProgress: json['performanceProgress'] != null
          ? Progress.fromJson(json['performanceProgress'])
          : null,
      professionTitle: json['profession']['title'],
      objectives: objectives,
    );
  }
}

class Progress {
  final String color;
  final int value;

  Progress({this.color, this.value});

  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      value: json['value'],
      color: json['colorRange'],
    );
  }
}

class StrategyStatus {
  String title;
  String code;

  StrategyStatus({this.title, this.code});

  factory StrategyStatus.fromJson(Map<String, dynamic> json) {
    return StrategyStatus(
      title: json['title'],
      code: json['code'],
    );
  }
}

class Objective {
  String perspectiveTitle;
  Progress excutionProgress, perforemanceProgress;
  String profissionTitle;
  int weight;
  String title;

  Objective({
    this.excutionProgress,
    this.perforemanceProgress,
    this.perspectiveTitle,
    this.profissionTitle,
    this.weight,
    this.title,
  });

  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      excutionProgress: json['executionProgress'] != null
          ? Progress.fromJson(json['executionProgress'])
          : null,
      perforemanceProgress: json['performanceProgress'] != null
          ? Progress.fromJson(json['performanceProgress'])
          : null,
      weight: json['weight'],
      perspectiveTitle: json['perspective']['title'],
      //owner
      profissionTitle: json['profession']['title'],
      title: json['title'],
    );
  }
}
