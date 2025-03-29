import 'package:flutter/material.dart';
import 'dart:math' as math;

// This is a custom 3D-like animation since we're not using a real 3D rendering library
// For real 3D models, you would use flutter_3d_obj or model_viewer or model_viewer_plus
class Animated3DModel extends StatefulWidget {
  final Widget child;
  final double maxRotation;
  
  const Animated3DModel({
    super.key,
    required this.child,
    this.maxRotation = 0.1,
  });

  @override
  State<Animated3DModel> createState() => _Animated3DModelState();
}

class _Animated3DModelState extends State<Animated3DModel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationX = 0;
  double _rotationY = 0;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    
    _controller.addListener(() {
      setState(() {
        // Create a floating effect by adjusting rotation based on animation value
        _rotationX = math.sin(_controller.value * math.pi * 2) * widget.maxRotation;
        _rotationY = math.cos(_controller.value * math.pi * 2) * widget.maxRotation;
      });
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_rotationX)
        ..rotateY(_rotationY),
      child: widget.child,
    );
  }
} 