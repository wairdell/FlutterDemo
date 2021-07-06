import 'dart:math';

import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TweenDemoState();

}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin {

  AnimationController? _controller;

  Animation<Color?>? _colorAnimation;

  Animation<double>? _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(seconds: 2))..addListener(() {
      setState(() {});
    });
    _colorAnimation = ColorTween(begin: Colors.green, end: Colors.red).animate(_controller!);
    _sizeAnimation = Tween(begin: 100.0, end: 200.0).chain(CurveTween(curve: Curves.bounceIn)).animate(_controller!);
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if(_controller?.isDismissed ?? true) {
            _controller?.forward();
          } else {
            _controller?.reverse();
          }

        },
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(pi * (_controller?.value ?? 0)),
          child: Container(
            width: _sizeAnimation?.value,
            height: _sizeAnimation?.value,
            alignment: Alignment.center,
            color: _colorAnimation?.value,
            child: Text(_controller?.value.toString() ?? ""),
          ),
        ),
      ),
    );
  }



}