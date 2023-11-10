import 'package:flutter/widgets.dart';
import 'package:my_webapp/rating/view/bloc/rating_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
        buildWhen: (previous, current) =>
            previous.model.rating != current.model.rating,
        builder: (context, state) {
          // final rating = state.model.rating.rating;
          return Container();
        });
  }
}
