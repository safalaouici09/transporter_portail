class User {
  final String firstName;
  final String lastName;
  final String date_naissance;
  final String numero;
  final String adresse;
  final String operateur;

  const User({
    required this.firstName,
    required this.lastName,
    required this.date_naissance,
    required this.adresse,
    required this.numero,
    required this.operateur,
  });

  User copy({
    String? firstName,
    String? lastName,
    String? date_naissance,
    String? numero,
    String? adresse,
    String? operateur,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        date_naissance: date_naissance ?? this.date_naissance,
        numero: numero ?? this.numero,
        adresse: adresse ?? this.adresse,
        operateur: operateur ?? this.operateur,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          date_naissance == other.date_naissance &&
          numero == other.numero &&
          adresse == other.adresse &&
          operateur == other.operateur;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      date_naissance.hashCode ^
      numero.hashCode ^
      adresse.hashCode ^
      operateur.hashCode;
}
