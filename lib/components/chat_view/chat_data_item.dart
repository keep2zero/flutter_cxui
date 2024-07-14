class ChatDataItem {
  final String? ciId;
  final String? uid;
  final String? avatar;
  final String? name;
  final String? message;
  final String? url;
  final int? size;
  int? loadingSize;
  final int? time;
  final String? type;
  final String? thumb;
  final String? ext;
  final String? platform;
  final String? localThumb;
  final String? localUrl;
  final String? localRoot;
  ChatDataItem({
    this.ciId,
    this.uid,
    this.avatar,
    this.name,
    this.message,
    this.time,
    this.thumb,
    this.localThumb,
    this.localUrl,
    this.localRoot,
    this.type,
    this.url,
    this.size,
    this.loadingSize,
    this.ext,
    this.platform,
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
      platform: data["platform"],
      localThumb: data["localThumb"],
      localUrl: data["localUrl"],
      localRoot: data["localRoot"],
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
      "platform": platform,
      "localThumb": localThumb,
      "localUrl": localUrl,
      "localRoot": localRoot,
    };
  }

  @override
  String toString() {
    return "ciId: $ciId, uid: $uid, avatar: $avatar, name: $name, message: $message, time: $time, thumb: $thumb, type: $type, url: $url, size: $size, ext: $ext, platform: $platform, localThumb: $localThumb, localUrl: $localUrl，localRoot: $localRoot";
  }
}
