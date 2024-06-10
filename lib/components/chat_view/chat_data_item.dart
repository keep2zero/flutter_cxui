class ChatDataItem {
  final String? ciId;
  final String? uid;
  final String? avatar;
  final String? name;
  final String? message;
  final String? url;
  final int? size;
  final int? time;
  final String? type;
  final String? thumb;
  final String? ext;
  const ChatDataItem({
    this.ciId,
    this.uid,
    this.avatar,
    this.name,
    this.message,
    this.time,
    this.thumb,
    this.type,
    this.url,
    this.size,
    this.ext,
  });

  factory ChatDataItem.fromJson(Map<String, dynamic> data) {
    return ChatDataItem(
      ciId: data["ciId"],
      uid: data["uid"],
      avatar: data["avatar"],
      name: data["name"],
      message: data["message"],
      time: data["time"],
      thumb: data["thumb"],
      type: data["type"],
      url: data["url"],
      size: data["size"],
      ext: data["ext"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ciId": ciId,
      "uid": uid,
      "avatar": avatar,
      "name": name,
      "message": message,
      "time": time,
      "thumb": thumb,
      "type": type,
      "url": url,
      "size": size,
      "ext": ext,
    };
  }

  @override
  String toString() {
    return "ciId: $ciId, uid: $uid";
  }
}
