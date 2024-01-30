class CommunityModel {
  final String id;
  final String name;
  final String banner;
  final String avatar;
  final List<String> members;
  final List<String> mods;

//<editor-fold desc="Data Methods">
  const CommunityModel({
    required this.id,
    required this.name,
    required this.banner,
    required this.avatar,
    required this.members,
    required this.mods,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommunityModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          banner == other.banner &&
          avatar == other.avatar &&
          members == other.members &&
          mods == other.mods);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      banner.hashCode ^
      avatar.hashCode ^
      members.hashCode ^
      mods.hashCode;

  @override
  String toString() {
    return 'CommunityModel{ id: $id,'
        ' name: $name,'
        ' banner: $banner,'
        ' avatar: $avatar,'
        ' members: $members,'
        ' mods: $mods,}';
  }

  CommunityModel copyWith({
    String? id,
    String? name,
    String? banner,
    String? avatar,
    List<String>? members,
    List<String>? mods,
  }) {
    return CommunityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      avatar: avatar ?? this.avatar,
      members: members ?? this.members,
      mods: mods ?? this.mods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'banner': this.banner,
      'avatar': this.avatar,
      'members': this.members,
      'mods': this.mods,
    };
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      id: map['id'] as String,
      name: map['name'] as String,
      banner: map['banner'] as String,
      avatar: map['avatar'] as String,
      members: map['members'] as List<String>,
      mods: map['mods'] as List<String>,
    );
  }

//</editor-fold>
}
