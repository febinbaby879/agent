import 'package:json_annotation/json_annotation.dart';

import 'bank_account_info.dart';

part 'bank_operation.g.dart';

@JsonSerializable()
class BankOperation {
  String? operation;
  String? bankId;
  BankAccountInfo? bankData;
  BankOperation({
    this.operation,
    this.bankData,
    this.bankId,
  });

  factory BankOperation.fromJson(Map<String, dynamic> json) {
    return _$BankOperationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final map = _$BankOperationToJson(this);
    map.removeWhere((k,v)=> v==null);
    return map;
  }
}
