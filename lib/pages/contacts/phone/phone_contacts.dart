import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../support/view/block/blok.dart';
import '../../../support/view/supports_view.dart';

class ContactsPhone extends StatelessWidget {
  const ContactsPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(children: [
        const Text(''),
        const Row(
          children: [
            Text('телефон'),
            Text('888888'),
          ],
        ),
        const Row(
          children: [
            Text('email'),
            Text('@gmail.com'),
          ],
        ),
            const Text('По вопросам особенностей работы приложения, пожалуйста, обращайтесь в поддержку'),
            const TextField(),
            SizedBox(child: BlocBuilder<SupportBloc, SupportState>(
              buildWhen: (previous, current) => previous.model.length != current.model.length,
              builder: (context, state) {
                final mes = state.model;
                return Column(
                  children: [
                    for(var i = 0; i < mes.length; i++)
                    SupportView(model: mes[i],),
                  ],
                );
              }
            ))
      ]),
    );
  }
}