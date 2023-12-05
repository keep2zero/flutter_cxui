import "dart:convert";

import "package:http/http.dart" as http;

import "model.dart";

class APIURL {
  static String login = "";
  static String moveeCate = "";
  static String movieItem = "";
  static String movieList = "";
}

class HttpResult {
  final bool success;
  final String message;
  final String code;
  final dynamic data;
  final dynamic extra;

  HttpResult(this.success, this.message, this.code, this.data, this.extra);

  factory HttpResult.fromJson(String body) {
    final result = json.decode(body);

    return HttpResult(result["success"], result["message"],
        result["code"].toString(), result["data"], result["extra"]);
  }
}

class ApiRequest {
  static const host = "https://port.ankesmart.com/api/sw3SYSe0wKeVxRX";
  static Future<HttpResult> post(String path, String action, String returnName,
      Map<String, Object>? params) async {
    final postData = {
      "type": path,
      "name": returnName,
      "action": action,
      "response": "json",
      "params": params,
    };

    final res = await http.post(
      Uri.parse(host),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "request": [postData]
      }),
    );

    print(res.body);
    if (res.statusCode == 200) {
      return HttpResult.fromJson(res.body);
    } else {
      return HttpResult(false, "error: ${res.statusCode}", "2000", null, null);
    }
  }
}

class VideoRequest {
  static Future<List<VideoCate>> cateList() async {
    final result =
        await ApiRequest.post("video", "findVideoCate", "cates", null);
    if (result.success) {
      List<VideoCate> cates = [];
      final data = result.data;
      final catesData = data["cates"];
      for (var i = 0; i < catesData.length; i++) {
        final item = catesData[i];
        cates.add(VideoCate(item["cateId"], item["cateName"]));
      }
      return cates;
    }
    return [];
  }

  static Future<HttpResult> cateVideos(String cateId, int page, int size) {
    return ApiRequest.post("video", "findVideo", "videos", {
      "index": page,
      "size": size,
    });
  }

  static Future<List<VideoItem>> archiveLink(String valalias) async {
    final result =
        await ApiRequest.post("video", "findVideoArchiveLink", "links", {
      "index": 1,
      "size": 20,
      "vaalias": valalias,
    });

    if (result.success) {
      List<VideoItem> list = [];
      final data = result.data;
      final links = data["links"];
      for (var i = 0; i < links.length; i++) {
        final item = links[i];
        list.add(VideoItem(
            item["valId"], item["valTitle"], item["valCover"][0]["url"]));
      }
      return list;
    }

    return [];
  }

  static Future<List<VideoItem>> findVideList(String? cateId) async {
    dynamic params = {
      "index": 1,
      "size": 20,
    };
    if (cateId != null) {
      params["cateId"] = cateId;
    }
    final result =
        await ApiRequest.post("video", "findVideo", "videos", params);

    if (result.success) {
      List<VideoItem> list = [];
      final data = result.data;
      final videos = data["videos"];
      for (var i = 0; i < videos.length; i++) {
        final item = videos[i];
        list.add(
            VideoItem(item["vId"], item["vName"], item["vThumb"][0]["url"]));
      }
      return list;
    }

    return [];
  }

  static Future<HttpResult> videoItem(String vId) {
    return ApiRequest.post("video", "findVideoItem", "video", {"vId": vId});
  }
}
