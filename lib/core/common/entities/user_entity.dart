/// A class that represents a single user entity.
///
// Since we will need this entity in the blog feature,
// I left it to the common folder in the core folder.
class User {
  User({
    required this.id,
    required this.email,
    required this.name,
  });

  /// The user's unique identifier.
  ///
  /// A non-nullable String.
  final String id;

  /// The user's email.
  ///
  /// A non-nullable String.
  final String email;

  /// The user's name.
  ///
  /// A non-nullable String.
  final String name;
}
