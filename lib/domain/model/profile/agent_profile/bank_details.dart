import 'package:agent_dashboard/domain/model/profile/bank_account_info/bank_account_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetail {
  List<BankAccountInfo>? allBankAccounts;
  BankAccountInfo? defaultBankAccount;
  int? totalBankAccounts;
  bool? hasBankDetails;

  BankDetail({
    this.allBankAccounts,
    this.defaultBankAccount,
    this.totalBankAccounts,
    this.hasBankDetails,
  });

  factory BankDetail.fromJson(Map<String, dynamic> json) =>
      _$BankDetailFromJson(json);
  Map<String, dynamic> toJson() => _$BankDetailToJson(this);
}
