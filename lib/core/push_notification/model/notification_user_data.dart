class NotificationUser {
  final String userId;
  final String email;
  final String fcmToken;

  const NotificationUser(
      {required this.userId, required this.email, required this.fcmToken});

  factory NotificationUser.fromJson(Map<String, dynamic> json) {
    return NotificationUser(
      userId: json['userId'],
      email: json['email'],
      fcmToken: json['fcmToken'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'email': email,
        'fcmToken': fcmToken,
      };

  @override
  String toString() {
    return 'NotificationUser(userId: $userId, email: $email, fcmToken: $fcmToken)';
  }
}
