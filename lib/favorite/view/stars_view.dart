import 'package:flutter/material.dart';
import 'package:my_webapp/favorite/view/block/blok.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarsFavorite extends StatelessWidget {
  const StarsFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) =>
            previous.model.item != current.model.item,
        builder: (context, stateX) {
          return BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, stateY) {
            final isFavorite = stateY.model.contains(stateX.model.item);
            return CustomPaint(
              painter: MyStar(color: isFavorite ? Colors.amber : Colors.grey),
            );
          });
        });
  }
}

class MyStar extends CustomPainter {
  final Color color;
  const MyStar({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 3, 0);
    path.lineTo(size.width / 2, -size.height / 3);
    path.lineTo(2 * size.width / 3, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.75, size.height / 3);
    path.lineTo(size.width - size.width * 0.16, size.height - size.height / 3);
    path.lineTo(size.width / 2, size.height * 0.5);
    path.lineTo(size.width * 0.16, 2 * size.height / 3);
    path.lineTo(size.width * 0.25, size.height / 3);
    path.close();
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
