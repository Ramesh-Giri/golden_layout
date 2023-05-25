import 'package:flutter/material.dart';
import 'dart:math' as math;

class GoldenLayout extends StatefulWidget {
  final GoldenChild firstChild;
  final GoldenChild secondChild;
  final Axis axis;
  final bool showFirstChild;
  final bool showSecondChild;

  const GoldenLayout({
    super.key,
    required this.firstChild,
    required this.secondChild,
    this.axis = Axis.horizontal,
    this.showFirstChild = true,
    this.showSecondChild = true,
  });

  @override
  State<GoldenLayout> createState() => _GoldenLayoutState();
}

class _GoldenLayoutState extends State<GoldenLayout>
    with TickerProviderStateMixin {
  late AnimationController _firstChildController;
  late AnimationController _secondChildController;

  @override
  void initState() {
    super.initState();
    _firstChildController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _secondChildController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    if (widget.showFirstChild) {
      _firstChildController.forward();
    }
    if (widget.showSecondChild) {
      _secondChildController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant GoldenLayout oldWidget) {
    if (oldWidget.showFirstChild != widget.showFirstChild) {
      if (widget.showFirstChild) {
        _firstChildController.forward();
      } else {
        _firstChildController.reverse();
      }
    }
    if (oldWidget.showSecondChild != widget.showSecondChild) {
      if (widget.showSecondChild) {
        _secondChildController.forward();
      } else {
        _secondChildController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  double calculateGoldenRatio() {
    double sqrt5 = math.sqrt(5);
    return (1 + sqrt5) / 2;
  }

  @override
  void dispose() {
    super.dispose();
    _firstChildController.dispose();
    _secondChildController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double goldenRatio = calculateGoldenRatio();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (widget.axis == Axis.horizontal) {
          final double totalWidth = constraints.maxWidth;
          final double smallWidth = totalWidth / (1 + goldenRatio);
          final double largeWidth = totalWidth - smallWidth;

          return AnimatedBuilder(
            animation: _firstChildController,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.firstChild.isSmaller
                      ? SizedBox(
                          width: widget.showFirstChild
                              ? smallWidth * _firstChildController.value
                              : 0,
                          child: widget.firstChild.child,
                        )
                      : SizedBox(
                          width:
                              widget.showFirstChild ? largeWidth : totalWidth,
                          child: widget.firstChild.child,
                        ),
                  AnimatedBuilder(
                    animation: _secondChildController,
                    builder: (context, child) {
                      return widget.firstChild.isSmaller
                          ? SizedBox(
                              width: widget.showSecondChild
                                  ? largeWidth * _secondChildController.value
                                  : 0,
                              child: widget.secondChild.child,
                            )
                          : SizedBox(
                              width: widget.showSecondChild
                                  ? smallWidth * _secondChildController.value
                                  : 0,
                              child: widget.secondChild.child,
                            );
                    },
                  ),
                ],
              );
            },
          );
        } else {
          final double totalHeight = constraints.maxHeight;
          final double smallHeight = totalHeight / (1 + goldenRatio);
          final double largeHeight = totalHeight - smallHeight;

          return AnimatedBuilder(
            animation: _firstChildController,
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.firstChild.isSmaller
                      ? SizedBox(
                          height: widget.showFirstChild
                              ? smallHeight * _firstChildController.value
                              : 0,
                          child: widget.firstChild.child,
                        )
                      : SizedBox(
                          height:
                              widget.showFirstChild ? largeHeight : totalHeight,
                          child: widget.firstChild.child,
                        ),
                  AnimatedBuilder(
                    animation: _secondChildController,
                    builder: (context, child) {
                      return widget.firstChild.isSmaller
                          ? SizedBox(
                              height: widget.showSecondChild
                                  ? largeHeight * _secondChildController.value
                                  : 0,
                              child: widget.secondChild.child,
                            )
                          : SizedBox(
                              height: widget.showSecondChild
                                  ? smallHeight * _secondChildController.value
                                  : 0,
                              child: widget.secondChild.child,
                            );
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}

class GoldenChild {
  final Widget child;
  final bool isSmaller;

  GoldenChild({
    required this.child,
    this.isSmaller = false,
  });
}
