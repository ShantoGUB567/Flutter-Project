class Note {
  int? id;
  String content;

  Note({
    this.id,
    required this.content,
  });

  /*
  e.g. map - note
  {
    'id' : 1,
    'content' : 'hello',
  }

  Note{
    id: 1,
    content: 'hello'
  }
  */

  // Map -> Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int?,
      content: map['content'] as String,
    );
  }

  // Note -> Map
  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }
}
