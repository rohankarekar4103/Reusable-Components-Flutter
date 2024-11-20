
import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {

  final bool showActivityIndicator;
  final double progress;
  final Color color;
  final double strokeWidth;
  final Color progressColor;

  Indicators({
   this.showActivityIndicator = false,
   this.progress = 0.0,
   this.color = Colors.blue,
   this.strokeWidth = 4.0,
   this.progressColor = Colors.green
});

  @override
  Widget build(BuildContext context) {
    if(showActivityIndicator){
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: strokeWidth,
      );
    }else{
      return LinearProgressIndicator(
        value: progress,
        valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        backgroundColor: color,
      );
    }
  }
}
