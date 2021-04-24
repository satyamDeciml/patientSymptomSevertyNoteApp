import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {

  RoundedButton({this.widdd, this.color, @required this.onPressed});

  final Color color;
  final Widget widdd;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(

        elevation: 10.0,
        color: color,
        borderRadius: BorderRadius.circular(6.0),
        child: MaterialButton(

          onPressed: onPressed,
          minWidth: 165.0,
          height: 48.0,
          child: widdd
        ),
      ),
    );
  }
}


