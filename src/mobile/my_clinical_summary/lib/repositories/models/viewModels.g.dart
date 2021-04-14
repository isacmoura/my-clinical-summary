// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserViewModel _$UserViewModelFromJson(Map<String, dynamic> json) {
  return UserViewModel(
    json['id'] as int,
    json['name'] as String,
    json['email'] as String,
    (json['medications'] as List)
        ?.map((e) => e == null
            ? null
            : UserMedicationsViewModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['appointments'] as List)
        ?.map((e) => e == null
            ? null
            : UserAppointmentsViewModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UserMedicationsViewModel _$UserMedicationsViewModelFromJson(
    Map<String, dynamic> json) {
  return UserMedicationsViewModel(
    json['name'] as String,
    json['description'] as String,
  );
}

UserAppointmentsViewModel _$UserAppointmentsViewModelFromJson(
    Map<String, dynamic> json) {
  return UserAppointmentsViewModel(
    json['name'] as String,
    json['description'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}
