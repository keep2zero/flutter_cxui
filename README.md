# flutter_cxui

一个新的flutter界面组件库，及flutter应用界面库。

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
| <img src="assets/static/movie_home.png" width="" />      | <img src="assets/static/movie_item.png" width="" />       |
 




## 感谢支持

**您的支持，是我持续输出的动力.**

<!-- ![微信支持](assets/static/wechat.jpg) -->
<img src="assets/static/reward.jpg" alt="赞赏支持"  />
