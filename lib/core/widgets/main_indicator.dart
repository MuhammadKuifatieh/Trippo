import 'package:flutter/widgets.dart';

enum MainIndicatorSize {
  tiny,
  normal,
  full,
}

class MainIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final MainIndicatorSize indicatorSize;

  const MainIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.indicatorSize,
  });

  @override
  _MD2Painter createBoxPainter([VoidCallback? onChanged]) {
    return _MD2Painter(this, onChanged);
  }
}

class _MD2Painter extends BoxPainter {
  final MainIndicator decoration;

  _MD2Painter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == MainIndicatorSize.full) {
      rect = Offset(
            offset.dx,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == MainIndicatorSize.tiny) {
      rect = Offset(
            offset.dx + configuration.size!.width / 2 - 8,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(16, decoration.indicatorHeight);
    } else {
      rect = Offset(
            offset.dx + 6,
            configuration.size!.height - decoration.indicatorHeight,
          ) &
          Size(configuration.size!.width - 12, decoration.indicatorHeight);
    }

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.elliptical(8, 8),
        topLeft: const Radius.elliptical(8, 8),
      ),
      paint,
    );
  }
}
