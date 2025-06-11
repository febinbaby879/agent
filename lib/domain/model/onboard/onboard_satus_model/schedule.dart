class Schedule {
  final DateTime? date;
  final String? time;
  final String? meetingLink;
  final String? scheduledType;
  final String? notes;

  Schedule({
    this.date,
    this.time,
    this.meetingLink,
    this.scheduledType,
    this.notes,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      time: json['time'],
      meetingLink: json['meetingLink'],
      scheduledType: json['scheduledType'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date?.toIso8601String(),
      'time': time,
      'meetingLink': meetingLink,
      'scheduledType': scheduledType,
      'notes': notes,
    };
  }
}
