import 'package:flutter/material.dart';

class button_widget extends StatelessWidget {
  final String _btnText;
  final Color _btnLayoutColor;
  final Color _btnTextColor;
  final double _btnTextSize;
  final Radius _btnRadius;
  final VoidCallback _btnFun;
  final double _btnTextHorizontalDistance;
  final double _btnTextVerticalDistance;

  const button_widget(
      this._btnText,
      this._btnLayoutColor,
      this._btnTextColor,
      this._btnTextSize,
      this._btnRadius,
      this._btnFun,
      this._btnTextHorizontalDistance,
      this._btnTextVerticalDistance,
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_btnLayoutColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(_btnRadius),
                )
            )
        ),
        onPressed: _btnFun,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _btnTextHorizontalDistance,
              vertical: _btnTextVerticalDistance),
          child: Text(_btnText,
              style: TextStyle(color: _btnTextColor, fontSize: _btnTextSize)),
        ),
      ),
    );
  }
}