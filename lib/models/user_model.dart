class UserModel {
  final String name;
  final String profilePic;
  final String uid;
  final String isAuthenticated;
  final String banner;
  final int karma;
  final String email;
  final List<String> awards;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,
    required this.banner,
    required this.karma,
    required this.email,
    required this.awards,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          profilePic == other.profilePic &&
          uid == other.uid &&
          isAuthenticated == other.isAuthenticated &&
          banner == other.banner &&
          karma == other.karma &&
          email ==other.email &&
          awards == other.awards);

  @override
  int get hashCode =>
      name.hashCode ^
      profilePic.hashCode ^
      uid.hashCode ^
      isAuthenticated.hashCode ^
      banner.hashCode ^
      karma.hashCode ^
      email.hashCode ^
      awards.hashCode;

  @override
  String toString() {
    return 'UserModel{ name: $name, profilePic: $profilePic, uid: $uid, isAuthenticated: $isAuthenticated, banner: $banner, karma: $karma,email: $email ,awards: $awards,}';
  }

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    String? isAuthenticated,
    String? banner,
    int? karma,
    String? email,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      banner: banner ?? this.banner,
      karma: karma ?? this.karma,
      email: email ?? this.email,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'profilePic': this.profilePic,
      'uid': this.uid,
      'isAuthenticated': this.isAuthenticated,
      'banner': this.banner,
      'karma': this.karma,
      'email': this.email,
      'awards': this.awards,
    };
  }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['name'] as String,
  //     profilePic: map['profilePic'] as String,
  //     uid: map['uid'] as String,
  //     isAuthenticated: map['isAuthenticated'] as String,
  //     banner: map['banner'] as String,
  //     karma: map['karma'] as int,
  //     awards: map['awards'] as List<String>,
  //   );
  // }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      banner: map['banner'] ?? '',
      uid: map['uid'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? 'false',
      karma: map['karma']?.toInt() ?? 0,
      email: map['email']?? '',
      awards: List<String>.from(map['awards']),
    );
  }

//</editor-fold>
}
