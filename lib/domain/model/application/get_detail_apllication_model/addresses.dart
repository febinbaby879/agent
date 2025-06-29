import 'package:agent_dashboard/domain/model/application/get_detail_apllication_model/permenant.dart';

import 'current.dart';

class Addresses {
  Current? current;
  Permanent? permanent;

  Addresses({this.current, this.permanent});

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        permanent: json['permanent'] == null
            ? null
            : Permanent.fromJson(json['permanent'] as Map<String, dynamic>),
      );
}
