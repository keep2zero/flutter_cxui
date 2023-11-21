# flutter_cxui

flutter_cui是一个基于Flutter框架的UI工具包，开发在Material框架下。它提供了丰富的可重用组件和样式， 它可以帮助开发者快速构建高性能、高保真度、高一致性的跨平台应用程序。

## 使用

`CxConfig 是自定义的`

```Dart
import 'package:flutter_cxui/cxui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  CxCard(
          shadow: true,
          radius: 16,
          bgColor: CxConfig.primary,
          hdBgColor: CxConfig.white.withAlpha(90),
          titleColor: CxConfig.white,
          margin: EdgeInsets.all(10),
          title: "Actions",
          actions: [
            CxIconButton(
              icon: Icons.arrow_circle_right_outlined,
              color: CxConfig.white,
              size: 18,
            )
          ],
          body: Text("hello"),
        ),
      ),
    );
  }
}
```

## 组件预览

<!-- ![选择按钮列表](assets/static//select_button_list.jpg) -->

|||
|--|--|
|![home](assets/static/list.png)|![place_grid](assets/static/place_grid.png)|
|![icon_button](assets/static/icon_button.png)|![select_button_list](assets/static/select_button_list.png)|
|![image_card](assets/static/image_card.png)|![card](assets/static/card.png)|
|![title_nav](assets/static/title_nav.png)|![slider](assets/static/slider.jpg)|

## 实例预览

|        |   |
| ----------- | ----------- |
| ![Movie Home](assets/static/movie_home.png)     | ![Movie Item](assets/static/movie_item.png) |

## 感谢支持

**您的支持，是我持续输出的动力.**

<!-- ![微信支持](assets/static/wechat.jpg) -->
![赞赏支持](assets/static/reward.jpg)
