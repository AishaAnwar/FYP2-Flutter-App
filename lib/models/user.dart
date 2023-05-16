class UserModel{
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNo;
  final String? password;
  const UserModel ({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  toJson(){
    return {
      "FirstName": firstname,
      "LastName": lastname,
      "Email": email,
      "Password": password,
      "PhoneNo": phoneNo
    };
  }
  
}