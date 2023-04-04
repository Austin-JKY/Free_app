import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constant.dart';

class Triangle extends CustomPainter {
  var msize;

  Triangle(this.msize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = blue;
    var uppath = Path();
    uppath.moveTo((msize.width * 1) / 20, 0);
    uppath.lineTo(msize.width, 0);
    uppath.lineTo(msize.width, msize.height / 3);
    uppath.close();

    canvas.drawPath(uppath, paint);

    var paint1 = Paint();
    paint1.color = blue3;
    var sidepath = Path();
    sidepath.lineTo(msize.width, 0);
    sidepath.lineTo(0, msize.height / 4);
    sidepath.close();

    canvas.drawPath(sidepath, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Flashscreen extends CustomPainter {
  var msize;
  Flashscreen(this.msize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint3 = Paint();
    paint3.color = blue3;
    var uppath3 = Path();

    uppath3.lineTo(msize.width, 0);
    uppath3.lineTo(msize.width, msize.height / 10);
    uppath3.lineTo(0, msize.height);

    uppath3.close();

    canvas.drawPath(uppath3, paint3);

    var paint1 = Paint();
    paint1.color = blue2;
    var uppath1 = Path();

    uppath1.lineTo(msize.width, 0);
    uppath1.relativeLineTo(0, msize.width);
    uppath1.lineTo(0, msize.height / 10);

    uppath1.close();
    canvas.drawPath(uppath1, paint1);

    var paint = Paint();
    paint.color = blue;
    var uppath = Path();

    uppath.moveTo(msize.width, msize.height);
    uppath.lineTo(0, msize.height);
    uppath.lineTo(msize.width, msize.height / 10);

    uppath.close();

    canvas.drawPath(uppath, paint);

    var paint4 = Paint();
    paint4.color = blue2;
    var uppath4 = Path();

    uppath4.moveTo(0, (msize.height / 4) * 3);
    uppath4.lineTo(0, msize.height);
    uppath4.lineTo((msize.width / 6) * 5, msize.height);

    uppath4.close();

    canvas.drawPath(uppath4, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CreatePostDesgin extends CustomPainter {
  var msize;
  CreatePostDesgin(this.msize);
  @override
  void paint(Canvas canvas, Size size) {
    var paint3 = Paint();
    paint3.color = blue3;
    var uppath3 = Path();

    uppath3.lineTo(msize.width / 1.7, 0);
    uppath3.lineTo(0, msize.height / 10);

    uppath3.close();
    canvas.drawPath(uppath3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
