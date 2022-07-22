class AddRoutineModel {
  final String? title;
  final String? description;
  final String? createDate;
  final String? dueDate;
  final String? frequency;
  final String? status;

  AddRoutineModel(
      {this.title,
      this.description,
      this.createDate,
      this.dueDate,
      this.frequency,
      this.status});

  Map<String, dynamic> toJson() {
    return {
       'title': title,
        'description': description,
        'frequency': frequency,
        'createDate': createDate,
        'dueDate': dueDate,
        'status': status
    };
  }
}
