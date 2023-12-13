//class UserModel {
//   UserModel({
//     required this.relationId,
//     required this.relationType,
//     required this.origin,
//     required this.fundId,
//     required this.entityId,
//     required this.unitId,
//     required this.investorCode,
//     required this.subsStatus,
//     required this.pmtDate,
//     required this.applDate,
//     required this.appliedBy,
//     required this.admDate,
//     required this.closingDate,
//     required this.admittedBy,
//     required this.commitment,
//     required this.comission,
//     required this.fx,
//     required this.investedAmnt,
//     required this.pmtAmnt,
//     required this.pricingDate,
//     required this.unitPrice,
//     required this.noUnits,
//     required this.lockUp,
//     required this.tranType,
//     required this.callId,
//     required this.certId,
//     required this.docId,
//     required this.comment,
//     required this.postStatus,
//     required this.entityName,
//     required this.shortName,
//     required this.legalForm,
//     required this.aifNature,
//     required this.aifType,
//     required this.isRegulated,
//     required this.number,
//     required this.street,
//     required this.city,
//     required this.code,
//     required this.country,
//     required this.eua,
//     required this.promoterId,
//     required this.userId,
//     required this.date,
//     required this.entityStatus,
//     required this.expiryDate,
//     required this.userFunction,
//     required this.isAuth,
//     required this.commsNotice,
//     required this.commsCas,
//     required this.commsReport,
//     required this.commsOther,
//     required this.addedBy,
//     required this.addedOn,
//   });
//
//   final int? relationId;
//   final int? relationType;
//   final int? origin;
//   final int? fundId;
//   final int? entityId;
//   final int? unitId;
//   final int? investorCode;
//   final int? subsStatus;
//   final dynamic pmtDate;
//   final DateTime? applDate;
//   final int? appliedBy;
//   final DateTime? admDate;
//   final DateTime? closingDate;
//   final int? admittedBy;
//   final int? commitment;
//   final int? comission;
//   final int? fx;
//   final int? investedAmnt;
//   final int? pmtAmnt;
//   final dynamic pricingDate;
//   final int? unitPrice;
//   final int? noUnits;
//   final dynamic lockUp;
//   final int? tranType;
//   final int? callId;
//   final int? certId;
//   final int? docId;
//   final String? comment;
//   final int? postStatus;
//   final String? entityName;
//   final String? shortName;
//   final String? legalForm;
//   final int? aifNature;
//   final int? aifType;
//   final int? isRegulated;
//   final String? number;
//   final String? street;
//   final String? city;
//   final String? code;
//   final String? country;
//   final int? eua;
//   final int? promoterId;
//   final int? userId;
//   final DateTime? date;
//   final int? entityStatus;
//   final DateTime? expiryDate;
//   final int? userFunction;
//   final dynamic isAuth;
//   final int? commsNotice;
//   final int? commsCas;
//   final int? commsReport;
//   final int? commsOther;
//   final int? addedBy;
//   final DateTime? addedOn;
//
//   factory UserModel.fromJson(Map<String, dynamic> json){
//     return UserModel(
//       relationId: json["relation_id"],
//       relationType: json["relation_type"],
//       origin: json["origin"],
//       fundId: json["fund_id"],
//       entityId: json["entity_id"],
//       unitId: json["unit_id"],
//       investorCode: json["investor_code"],
//       subsStatus: json["subs_status"],
//       pmtDate: json["pmt_date"],
//       applDate: DateTime.tryParse(json["appl_date"] ?? ""),
//       appliedBy: json["applied_by"],
//       admDate: DateTime.tryParse(json["adm_date"] ?? ""),
//       closingDate: DateTime.tryParse(json["closing_date"] ?? ""),
//       admittedBy: json["admitted_by"],
//       commitment: json["commitment"],
//       comission: json["comission"],
//       fx: json["fx"],
//       investedAmnt: json["invested_amnt"],
//       pmtAmnt: json["pmt_amnt"],
//       pricingDate: json["pricing_date"],
//       unitPrice: json["unit_price"],
//       noUnits: json["no_units"],
//       lockUp: json["lock_up"],
//       tranType: json["tran_type"],
//       callId: json["call_id"],
//       certId: json["cert_id"],
//       docId: json["doc_id"],
//       comment: json["comment"],
//       postStatus: json["post_status"],
//       entityName: json["entity_name"],
//       shortName: json["short_name"],
//       legalForm: json["legal_form"],
//       aifNature: json["aif_nature"],
//       aifType: json["aif_type"],
//       isRegulated: json["is_regulated"],
//       number: json["number"],
//       street: json["street"],
//       city: json["city"],
//       code: json["code"],
//       country: json["country"],
//       eua: json["eua"],
//       promoterId: json["promoter_id"],
//       userId: json["user_id"],
//       date: DateTime.tryParse(json["date"] ?? ""),
//       entityStatus: json["entity_status"],
//       expiryDate: DateTime.tryParse(json["expiry_date"] ?? ""),
//       userFunction: json["user_function"],
//       isAuth: json["is_auth"],
//       commsNotice: json["comms_notice"],
//       commsCas: json["comms_cas"],
//       commsReport: json["comms_report"],
//       commsOther: json["comms_other"],
//       addedBy: json["added_by"],
//       addedOn: DateTime.tryParse(json["added_on"] ?? ""),
//     );
//   }
//
// }
class UserModel {
  int? entityId;
  String? entityName;

  UserModel({this.entityId, this.entityName});

  UserModel.fromJson(Map<String, dynamic> json) {
    entityId = json['entity_id'];
    entityName = json['entity_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['entity_id'] = this.entityId;
    data['entity_name'] = this.entityName;
    return data;
  }
}