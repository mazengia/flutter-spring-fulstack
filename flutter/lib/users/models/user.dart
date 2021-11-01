class Users {
  String userName;
  String password;
  String firstName;
  String lastName;

  Users({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  factory Users.fromMap(Map taskMap) {
    return Users(
      userName: taskMap['userName'],
      firstName: taskMap['firstName'],
      lastName: taskMap['lastName'],
      password: taskMap['password'],
    );
  }
}