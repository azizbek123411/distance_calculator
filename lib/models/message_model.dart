class  MessageModel{
  int? id;
  String title;
  String body;
  int userID;
  MessageModel({
     this.id,
    required this.title,
    required this.body,
    required this.userID,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userID': userID,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      userID: map['userID'] as int,
    );
  }
}