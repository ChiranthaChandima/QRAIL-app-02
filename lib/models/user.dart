class SignUpRequest {
  final String user_name;
  final String user_email;
  final String user_phone;
  final String nic;
  final String role_type;
  final String logged_user_name;
  final String logged_user_password;

  SignUpRequest({
    required this.user_name, 
    required this.user_email,
    required this.user_phone, 
    required this.nic,  
    required this.role_type, 
    required this.logged_user_name,  
    required this.logged_user_password
  });

factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return SignUpRequest(
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_phone: json['user_phone'],
      nic: json['nic'],
      role_type: json['role_type'],
      logged_user_name: json['logged_user_name'],
      logged_user_password: json['logged_user_password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'user_name': user_name, 
    'user_email': user_email,
    'user_phone' : user_phone, 
    'nic' : nic, 
    'role_type' : role_type, 
    'logged_user_name' : logged_user_name, 
    'logged_user_password' : logged_user_password
    
    };
}
