
class UserModel {
    UserModel({
        this.id,
        this.email,
        this.password,
    });

    final String? id;
    final String? email;
    final String? password;

    UserModel copyWith({
        String? id,
        String? email,
        String? password,
    }) => 
        UserModel(
            id: id ?? this.id,
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
    };
}
