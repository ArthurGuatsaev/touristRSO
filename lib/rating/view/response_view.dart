import 'package:flutter/material.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/rating/view/bloc/rating_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseView extends StatelessWidget {
  const ResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: BlocBuilder<RatingBloc, RatingState>(builder: (context, state) {
          return Column(
            children: [
              const TextField(),
              for (var i = 0; i < state.model.rate.length; i++)
                ResponseWidget(
                  response: state.model.rate[i],
                )
            ],
          );
        }));
  }
}

class ResponseWidget extends StatelessWidget {
  final ResponseModel response;
  const ResponseWidget({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Colors.amber),
          Expanded(
            child: Column(
              children: [
                Text(response.name),
                Text(response.text),
                Text(response.date)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> myCommentList = [
  message,
];
Map<String, String> message = {
  'name': 'Ivan Ivanov',
  'comment': 'This is my comment',
  'time': '15:14, 12.12.23',
  'image': ''
};
