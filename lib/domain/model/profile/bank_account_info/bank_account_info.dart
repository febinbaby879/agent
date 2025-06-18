import 'package:json_annotation/json_annotation.dart';

part 'bank_account_info.g.dart';

@JsonSerializable()
class BankAccountInfo {
  String? bankName;
  String? currency;
  bool? isDefault;
  bool? isActive;
  @JsonKey(name: '_id')
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accountHolderName;
  String? accountNumber;
  String? bankAddress;
  String? swiftCode;
  String? accountType;
  String? iban;

  BankAccountInfo({
    this.bankName,
    this.currency,
    this.isDefault,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.accountHolderName,
    this.accountNumber,
    this.bankAddress,
    this.swiftCode,
    this.accountType,
    this.iban,
  });

  factory BankAccountInfo.fromJson(Map<String, dynamic> json) {
    return _$BankAccountInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final map = _$BankAccountInfoToJson(this);
    map.removeWhere((k, v) => v == null);
    return map;
  }

  BankAccountInfo copyWith({
    String? bankName,
    String? currency,
    bool? isDefault,
    bool? isActive,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? accountHolderName,
    String? accountNumber,
    String? bankAddress,
    String? swiftCode,
    String? accountType,
    String? iban,
  }) {
    return BankAccountInfo(
      bankName: bankName ?? this.bankName,
      currency: currency ?? this.currency,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankAddress: bankAddress ?? this.bankAddress,
      swiftCode: swiftCode ?? this.swiftCode,
      accountType: accountType ?? this.accountType,
      iban: iban ?? this.iban,
    );
  }
}
