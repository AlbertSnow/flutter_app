import 'dart:ui';

import 'package:flutter/material.dart';

class PriceDetailBottomSheet extends StatelessWidget {
  final void Function()? startDeliver;

  PriceDetailBottomSheet({this.startDeliver});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            buildTitle(context),
            buildListItem('基础配送费', null, '6'),
            buildListItem('距离附加', '8.5公里', '12'),
            buildListItem('重量附加', '8公斤', '6'),
            buildListItem('特殊时段附加', '', '4'),
            buildListItem('临时加价', null, '5'),
            buildDivider(),
            buildListItem('消费', null, '8'),
            buildDivider(),
            buildListItem('优惠券', null, '-5'),
            buildDisplayCount(16.56, context),
            Center(
              child: GestureDetector(
                onTap: () => jumpPriceRulePage,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '计价规则 >',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    )),
              ),
            ),
            buildClickCount(16.56, context)
          ],
        ));
  }

  void jumpPriceRulePage() {}

  Padding buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14, right: 14, top: 14),
      child: Stack(children: [
        Center(
          child: Text(
            '费用明细',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF222222)),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(), child: Text('X')),
        )
      ]),
    );
  }

  buildListItem(
    String? leading,
    String? tip,
    String? priceString, {
    TextStyle? leadingStyle,
    TextStyle? trailStyle,
  }) {
    priceString = priceString ?? '0';
    double price = double.parse(priceString);
    bool isNegative = priceString.startsWith('-');

    return Padding(
      padding: EdgeInsets.only(top: 14, left: 15, right: 30),
      child: Row(
        children: [
          Text(leading ?? ' ',
              style: leadingStyle != null
                  ? leadingStyle
                  : TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF333333))),
          Visibility(
            visible: tip?.isNotEmpty ?? false,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(tip ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF999999))),
            ),
          ),
          Spacer(),
          Text((isNegative ? "-" : '') + "￥$priceString",
              style: trailStyle != null
                  ? trailStyle
                  : TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color:
                          isNegative ? Color(0xFFFF6A00) : Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget buildDivider({EdgeInsetsGeometry? paddingParam, double heightParam = 1}) {
    return Padding(
      padding: paddingParam != null? paddingParam : EdgeInsets.only(left: 15, top: 14),
      child: SizedBox(
        width: double.infinity,
        height: heightParam,
        child: Container(
          // color: Color(0xFFEEEEEE),
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget buildDisplayCount(double count, BuildContext context) {
    return startDeliver != null
        ? SizedBox(height: 15,)
        : Column(
            children: [
              buildDivider(),
              buildListItem(
                '实付金额',
                null,
                count.toString(),
                leadingStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF333333)),
                trailStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 8, end: 30),
                  child: Text(
                    '支付方式：余额',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF999999)),
                  ),
                ),
              )
            ],
          );
  }

  Widget buildClickCount(double count, BuildContext context) {
    return startDeliver == null
        ? SizedBox.shrink()
        : Column(children: [
            buildDivider(
              paddingParam: EdgeInsets.only(left: 0),
                heightParam: 0.5),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 65,
              child: Row(
                children: [
                  Text(
                    '合计',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF1A1A1A)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4, right: 10),
                    child: Text(
                      '¥$count',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFFFF6A00)),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        '明细^',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Color(0xFF333333)),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: startDeliver ?? () => {},
                    child: Text(
                      '发起配送',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1A1A1A)),
                    ),
                  )
                ],
              ),
            )
          ]);
  }
}

/// we can see from this blog:  https://www.kindacode.com/article/flutter-bottom-sheet-examples/
/// there totally 3 type bottomSheet.
/// 1. model bottom sheet (have semi transparent background on top of sheet)
/// 2. persistent Bottom Sheet (click outset not invisible, and is Scaffold field )
/// 3. multi edit text： keep IMS not cover edit text (bottom: MediaQuery.of(ctx).viewInsets.bottom + 15)
void showPriceDetailBottomSheet(BuildContext context) {
  showModalBottomSheet(
      elevation: 10,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (ctx) => PriceDetailBottomSheet(
            // startDeliver: () {
            //   print("----------- hello jialiang");
            // },
          ));
}
