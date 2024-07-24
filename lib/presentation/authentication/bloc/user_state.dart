
import '../../../common/constant/gender.dart';

class UserState {}

class UserRequestState extends UserState {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String passwordConfirm;
  final int birthYear;
  final Gender gender;

  // final String phoneNo;

  UserRequestState({
    this.name = "",
    this.surname = "",
    this.email = "",
    this.password = "",
    this.passwordConfirm = "",
    this.birthYear = 0,
    this.gender = Gender.unselected,
  });

  UserRequestState copyWith(
      {String? name, String? surname, String? email, String? password, String? passwordConfirm, int? birthYear, Gender? gender}) {
    return UserRequestState(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        birthYear: birthYear ?? this.birthYear,
        gender: gender ?? this.gender);
  }

  Map<String, dynamic> toMap(String uid) {
    return {
      'id': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'birthYear': birthYear,
      'gender': gender.text
    };
  }
}
