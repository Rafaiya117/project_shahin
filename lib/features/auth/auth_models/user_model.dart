class UserModel {
  final int? id;
  final String email;
  final String fullName;
  final String role;
  final String? profilePicture;
  final String? dateOfBirth;
  final int? age;
  final bool? isSubscribed;
  final bool? isFreeTrialExpired;
  final int? level;
  final bool? isActive;

  UserModel({
    this.id,
    required this.email,
    required this.fullName,
    this.role = 'UserRole.USER', 
    this.profilePicture,
    this.dateOfBirth,
    this.age,
    this.isSubscribed,
    this.isFreeTrialExpired,
    this.level,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      role: json['role'] as String? ?? 'UserRole.USER',
      profilePicture: json['profile_picture'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      age: json['age'] as int?,
      isSubscribed: json['is_subscribed'] as bool?,
      isFreeTrialExpired: json['is_free_trial_expired'] as bool?,
      level: json['level'] as int?,
      isActive: json['is_active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'role': role,
      'profile_picture': profilePicture,
      'date_of_birth': dateOfBirth,
      'age': age,
      'is_subscribed': isSubscribed,
      'is_free_trial_expired': isFreeTrialExpired,
      'level': level,
      'is_active': isActive,
    };
  }
}
