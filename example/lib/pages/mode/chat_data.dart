import 'package:flutter_cxui/components/chat_view/chat_data_item.dart';

final chatData = [
  const ChatDataItem(
    name: "Text",
    message: "https://www.onelineteam.com",
    type: "link",
  ),
  const ChatDataItem(
    name: "Text",
    message: "You can enable parsing of only some link types using the linkifiers option. URL and email are enabled by default.",
    type: "text",
  ),
  const ChatDataItem(
    name: "hello",
    message: "https://flatfull.com/themes/todo/images/avatar.jpg",
    avatar: "https://img.zcool.cn/community/01114b5de61f96a80120686b6fd3f8.jpg?x-oss-process=image/resize,m_fill,w_160,h_160,limit_0/auto-orient,1/sharpen,100/quality,q_100/format,webp",
    type: "file",
    ext: "xlsx",
    size: 20,
  ),
  const ChatDataItem(
    name: "hello",
    message: "https://flatfull.com/themes/todo/images/avatar.jpg",
    avatar: "https://flatfull.com/themes/todo/images/avatar.jpg",
    type: "image",
  ),
  ChatDataItem(
    name: "word",
    message: "我是谁",
    type: "text",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    name: "肖丽",
    message: "...........",
    type: "text",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    name: "米兰",
    message: "你们都在说啥",
    type: "text",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    message: "辰汐科技企业介绍.ppt",
    type: "file",
    ext: "ppt",
    url: "http://www.flutter.com/cx.ppt",
    size: 900,
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
    name: "word",
  ),
  ChatDataItem(
    message: "这是辰汐科技的xxx原理图.zip",
    type: "file",
    ext: "zip",
    url: "http://www.flutter.com/fdsfdsfs/dfsdfsdfdsfsdfsd/abc.zip",
    size: 900,
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
    name: "word",
  ),
  ChatDataItem(
    message: "https://i.pravatar.cc/300?t=${DateTime.now()}",
    type: "image",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    message: "这不是flutter官网吗？",
    type: "text",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    message: "是的吧",
    type: "text",
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
  ),
  ChatDataItem(
    message: "辰汐科技合同.word",
    type: "file",
    ext: "word",
    url: "http://www.flutter.com/fdsfdsfs/dfsdfsdfdsfsdfsd/abc.zip",
    size: 900,
    avatar: "https://i.pravatar.cc/300?t=${DateTime.now()}",
    name: "word",
  ),
];
