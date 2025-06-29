class Summary {
  int? total;
  int? leads;
  int? inProgress;
  int? review;
  int? done;
  int? completed;

  Summary({
    this.total,
    this.leads,
    this.inProgress,
    this.review,
    this.done,
    this.completed,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json['total'] as int?,
        leads: json['leads'] as int?,
        inProgress: json['inProgress'] as int?,
        review: json['review'] as int?,
        done: json['done'] as int?,
        completed: json['completed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'leads': leads,
        'inProgress': inProgress,
        'review': review,
        'done': done,
        'completed': completed,
      };
}
