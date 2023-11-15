import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/place_grid/place_grid.dart';
import 'package:flutter_cxui/config.dart';

List<PlaceGridItem> pgi_01 = [
  PlaceGridItem(
    icon: Icons.list_alt,
    title: "预约 | 加追",
    iconSize: 26,
    // color: ,
  ),
  PlaceGridItem(
    icon: Icons.download_for_offline_outlined,
    title: "我的下载",
    iconSize: 26,
    // color: gcolor,
  ),
  PlaceGridItem(
    icon: Icons.video_collection_outlined,
    title: "我的片单",
    iconSize: 26,
    // color: gcolor,
    // color: Colors.purple,
  ),
  PlaceGridItem(
    icon: Icons.star_border,
    title: "我的收藏",
    // color: Colors.pink,
    // color: gcolor,
    iconSize: 26,
  ),
];
List<PlaceGridItem> pgi_02 = [
  PlaceGridItem(
    icon: Icons.list_alt,
    title: "预约 | 加追",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: gcolor,
  ),
  PlaceGridItem(
    icon: Icons.download_for_offline_outlined,
    title: "我的下载",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: gcolor,
  ),
  PlaceGridItem(
    icon: Icons.video_collection_outlined,
    title: "我的片单",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: Colors.purple,
  ),
  PlaceGridItem(
    icon: Icons.star_border,
    title: "我的收藏",
    iconColor: CxConfig.highlight,
    iconSize: 26,
  ),
];
