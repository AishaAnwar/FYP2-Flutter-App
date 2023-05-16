class UserModel{
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNo;
  final String? password;
  final bool? profileBool;
  const UserModel ({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.profileBool,
  });

  toJson(){
    return {
      "FirstName": firstname,
      "LastName": lastname,
      "Email": email,
      "Password": password,
      "PhoneNo": phoneNo,
      "ProfileBool":profileBool

    };
  }
  
}