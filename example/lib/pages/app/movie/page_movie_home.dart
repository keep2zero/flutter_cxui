// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cxui/components/card/card.dart';
import 'package:flutter_cxui/cxui.dart';
import 'package:ionicons/ionicons.dart';

import '../../../config.dart';
import 'data/api.dart';
import 'data/model.dart';

class PageMovieHome extends StatefulWidget {
  const PageMovieHome({super.key});

  @override
  State<PageMovieHome> createState() => _PageMovieHomeState();
}

class _PageMovieHomeState extends State<PageMovieHome> {
  List<VideoCate> cateList = [];
  List<VideoItem> links = [];
  List<VideoItem> recent = [];
  List<VideoItem> videos = [];

  final _colors = [
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
    Colors.teal
  ];

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VideoRequest.cateList().then((value) {
      setState(() {
        cateList = value;
      });
    });

    VideoRequest.archiveLink("home").then((value) {
      setState(() {
        links = value;
      });
    });

    VideoRequest.archiveLink("recent").then((value) {
      setState(() {
        recent = value;
      });
    });

    VideoRequest.findVideList(null).then((value) {
      videos = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors[index],
      appBar: AppBar(
        backgroundColor: _colors[index],
        centerTitle: true,
        actions: [
          Icon(
            Ionicons.game_controller,
            color: Colors.white.withAlpha(200),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white.withAlpha(200),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        leading: buildLeading(),
        title: buildSearchbar(),
      ),
      body: buildBody(context),
    );
  }

  Widget buildLeading() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CxButton(
          height: 36,
          padding: const EdgeInsets.all(0),
          color: Colors.white.withAlpha(50),
          type: CxButtonType.fill,
          text: "追",
          icon: Icons.menu,
        ),
      ),
    );
  }

  Container buildSearchbar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(
        left: 0,
        top: 3,
        bottom: 3,
        right: 10,
      ),
      child: TextField(
        style: const TextStyle(fontSize: 12),
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(230),
            gapPadding: 0,
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(230),
            gapPadding: 0,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withAlpha(150),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white.withAlpha(150),
          isDense: true,
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.03, 0.1],
            tileMode: TileMode.decal,
            colors: [
              _colors[index],
              CxConfig.white,
            ],
          ),
        ),
        child: Column(
          children: [
            CxTitleNav(
              onChange: (int ix) {
                setState(() {
                  index = ix;
                });
              },
              color: Colors.white.withAlpha(160),
              selectColor: Colors.white,
              select: 0,
              items: cateList.map((VideoCate it) {
                return it.cateName;
              }).toList(),
            ),
            CxSliderView(
              onTap: (SliderObject obj, int index) {
                Navigator.of(context).pushNamed("/app/movie/item");
              },
              objects: links
                  .map((VideoItem it) => SliderObject(it.vName, it.vCover))
                  .toList(),
            ),
            buildList(context),
            buildEnd(context),
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: GridView.builder(
        controller: null,
        shrinkWrap: true,
        itemCount: recent.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    if (recent.length == 0) return null;
    return CxImageCard(
      imgIsNet: true,
      title: recent[index].vName,
      // subtitle: recent[index].,
      img: recent[index].vCover,
    );
  }

  Widget buildEnd(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (ctx, inx) {
        return SizedBox(
          height: 200,
          child: CxImageCard(
            imgIsNet: true,
            title: videos[inx].vName,
            // subtitle: "是什么",
            img: videos[inx].vCover,
          ),
        );
      },
    );
  }
}
