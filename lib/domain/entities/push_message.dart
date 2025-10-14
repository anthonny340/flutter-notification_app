//Esta entidad me va a permitir hacer rapidamente un mapeo y
//poder ver como luce mi data

class PushMessage {
  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  PushMessage({
    required this.messageId,
    required this.title,
    required this.body,
    required this.sentDate,
    this.data,
    this.imageUrl,
  });

  @override
  String toString() {
    return '''
---- PushMessag ----
  id: $messageId
  title: $title
  body: $body
  sentDate: $sentDate
  data: $data
  imageUrl: $imageUrl
''';
  }
}
