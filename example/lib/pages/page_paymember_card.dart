import 'package:flutter/material.dart';
import 'package:flutter_cxui/cards/pay/pay-member-card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_cxui',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('会员制购买'),
        ),
        body: Center(
          child: CxPayMemberCard(
            const [
              CxPayMemberCardData(title: "连续包月", intro: "折后5.9元/月", price: "9", priceDesc: "限时优惠"),
              CxPayMemberCardData(title: "连续包年", intro: "折后5.9元/月", price: "100", priceDesc: "限时优惠"),
              CxPayMemberCardData(title: "连续包年", intro: "折后5.9元/月", price: "100", priceDesc: "限时优惠"),
            ],
            onChange: (index) {
              print("the index is $index");
            },
          ),
        ),
      ),
    );
  }
}
