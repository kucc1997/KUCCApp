class NotificationData {
  final String title;
  final String body;
  final String? imageUrl;

  NotificationData({
    required this.title,
    required this.body,
    this.imageUrl,
  });

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
      title: map['title'],
      body: map['body'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'NotificationData(title: $title, body: $body, imageUrl: $imageUrl)';
  }
}
