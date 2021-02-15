class LoginRequest {
  LoginRequest({
    this.name,
    this.email,
    this.role,
    this.password,
  });

  String name;
  String email;
  String role;
  String password;

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "role": role,
    "password": password,
  };
}