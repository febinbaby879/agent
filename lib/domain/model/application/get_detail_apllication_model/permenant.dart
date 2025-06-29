class Permanent {
  final String? permanentAddress;
  final String? permanentState;
  final String? permanentCountry;

  Permanent({
    this.permanentAddress,
    this.permanentState,
    this.permanentCountry,
  });

  factory Permanent.fromJson(Map<String, dynamic> json) {
    return Permanent(
      permanentAddress: json['permanentAddress'] as String?,
      permanentState: json['permanentState'] as String?,
      permanentCountry: json['permanentCountry'] as String?,
    );
  }
}
