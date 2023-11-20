import 'package:flutter/material.dart';
import 'package:flutter_cxui/components/place_grid/place_grid.dart';
import 'package:flutter_cxui/config.dart';
import 'package:ionicons/ionicons.dart';

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
    icon: Ionicons.heart,
    title: "Good",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: gcolor,
  ),
  PlaceGridItem(
    icon: Ionicons.document,
    title: "Order",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: gcolor,
  ),
  PlaceGridItem(
    icon: Ionicons.color_palette_outline,
    title: "Diy",
    iconSize: 26,
    iconColor: CxConfig.highlight,
    // color: Colors.purple,
  ),
  PlaceGridItem(
    icon: Ionicons.flask_outline,
    title: "Write",
    iconColor: CxConfig.highlight,
    iconSize: 26,
  ),
  PlaceGridItem(
    icon: Icons.shop,
    title: "Shop",
    iconColor: CxConfig.highlight,
    iconSize: 26,
  ),
  PlaceGridItem(
    icon: Ionicons.scan,
    title: "Scan",
    iconColor: CxConfig.highlight,
    iconSize: 26,
  ),
  PlaceGridItem(
    icon: Icons.tv_rounded,
    title: "Tv",
    iconColor: CxConfig.highlight,
    iconSize: 26,
  ),
];
