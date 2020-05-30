import 'dart:convert';

class User {
  String name;
  String email;
  String password;
  int typeUser;

  User({
    this.name,
    this.email,
    this.password,
    this.typeUser,
  });

  User copyWith({
    String name,
    String email,
    String password,
    int typeUser,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      typeUser: typeUser ?? this.typeUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'typeUser': typeUser,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      typeUser: map['typeUser'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, typeUser: $typeUser)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.name == name &&
        o.email == email &&
        o.password == password &&
        o.typeUser == typeUser;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        typeUser.hashCode;
  }
}
