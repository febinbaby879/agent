class Current {
  String? address;
  String? state;
  String? country;

  Current({this.address, this.state, this.country});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        address: json['address'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'state': state,
        'country': country,
      };
}
