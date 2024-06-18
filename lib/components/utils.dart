import 'package:flutter/material.dart';

class CXUI {
  static show(BuildContext context, String type, String msg) {
    Color bg = Colors.black54;
    if (type == "success") {
      bg = Colors.green;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10,
        ),
        content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              msg,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static success(BuildContext context, String msg) {
    CXUI.show(context, "success", msg);
  }
}

// 常见图片后缀
// .bmp|.jpg|.jpeg|.jpe|.jxr|.png|.tif|.tiff|.avif|.xbm|.pjp|.svgz|.ico|.svg|.jfif|.webp|.pjpeg|.gif|.iff|.ilbm|.ppm|.pcx|.xcf|.xpm|.psd|.mng|.sai|.psp|.ufo

// 常见视频后缀
// .mp4|.3gp|.avi|.wmv|.mpeg|.mpg|.mov|.flv|.swf|.qsv|.kux|.mpg|.rm|.ram

// 常见音频后缀
// .mp3|.mp2|.mp1|.wav|.aif|.aiff|.au|.ra|.rm|.ram|.mid|.rmi
class FileUtil {
  static String ext(String url) {
    int i = url.lastIndexOf(".");
    if (i == -1) {
      return "";
    }
    return url.substring(i + 1).toLowerCase();
  }

  static bool isImage(String file) {
    final extstr = ext(file);
    return extstr == "jpg" ||
        extstr == "jpeg" ||
        extstr == "png" ||
        extstr == "bmp" ||
        extstr == "gif" ||
        extstr == "webp" ||
        extstr == "jpe" ||
        extstr == "avif" ||
        extstr == "svg" ||
        extstr == "ico";
  }

  static bool isVideo(String file) {
    final extstr = ext(file);
    return extstr == "mp4" ||
        extstr == "m3u8" ||
        extstr == "avi" ||
        extstr == "rm" ||
        extstr == "mov" ||
        extstr == "mpeg" ||
        extstr == "qt";
  }

  static bool isAudio(String file) {
    final extstr = ext(file);
    return extstr == "mp3" || extstr == "wav" || extstr == "mid";
  }
}

class LinkUtil {
  static bool isLink(String url) {
    final reg = RegExp(
        r"^(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]$");
    return reg.hasMatch(url);
  }
}
