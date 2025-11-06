class Note {
  int? id; // Primary Key (auto increment)
  String content;
  String? ipAddress;
  String? country;
  String? deviceId;
  DateTime? createdAt;

  Note({
    this.id,
    required this.content,
    this.ipAddress,
    this.country,
    this.deviceId,
    this.createdAt,
  });

  // map -> Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
      content: map['content'] ?? '',
      ipAddress: map['ipAddress'],
      country: map['country'],
      deviceId: map['deviceId'],
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt'].toString())
          : null,
    );
  }

  // Note -> map
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (country != null) 'country': country,
      if (deviceId != null) 'deviceId': deviceId,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }
}
