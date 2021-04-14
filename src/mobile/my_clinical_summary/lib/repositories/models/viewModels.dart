import 'package:json_annotation/json_annotation.dart';

part 'viewModels.g.dart';

@JsonSerializable(createToJson: false)
class UserViewModel {
  final int id;
  final String name;
  final String email;
  final List<UserMedicationsViewModel> medications;
  final List<UserAppointmentsViewModel> appointments;

  factory UserViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserViewModelFromJson(json);

  const UserViewModel(this.id, this.name, this.email, this.medications, this.appointments);
}

@JsonSerializable(createToJson: false)
class UserMedicationsViewModel {
  final String name;
  final String description;

  UserMedicationsViewModel(this.name, this.description);

  factory UserMedicationsViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserMedicationsViewModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserAppointmentsViewModel {
  final String name;
  final String description;
  final DateTime date;

  UserAppointmentsViewModel(this.name, this.description, this.date);

  factory UserAppointmentsViewModel.fromJson(Map<String, dynamic> json) =>
      _$UserAppointmentsViewModelFromJson(json);
}