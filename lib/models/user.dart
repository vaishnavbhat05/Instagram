class User {
  final int? id; // Nullable because it's auto-incremented in the database.
  final String name;
  final String imageUrl;

  User({this.id, required this.name, required this.imageUrl});

  // Convert User object to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  // Convert Map (from SQLite) to User object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }
}