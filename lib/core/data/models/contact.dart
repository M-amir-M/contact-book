class ContactModel {
  ContactModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.notes,
    this.picture = const [],
    this.phone,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? notes;
  final List<String> picture;
  final String? phone;
  String? get avatar => picture.length > 0
      ? picture.first
      : null;

  String get fullName => "${firstName ?? ''} ${lastName ?? ''}";

  ContactModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? notes,
    List<String>? picture,
    String? phone,
  }) =>
      ContactModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        notes: notes ?? this.notes,
        picture: picture ?? this.picture,
        phone: phone ?? this.phone,
      );

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["_id"] == null ? null : json["_id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        notes: json["notes"] == null ? null : json["notes"],
        picture: json["picture"] == null
            ? []
            : List<String>.from(json["picture"].map((x) => x)),
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "notes": notes == null ? null : notes,
        "picture": List<dynamic>.from(picture.map((x) => x)),
        "phone": phone == null ? null : phone,
      };
}
