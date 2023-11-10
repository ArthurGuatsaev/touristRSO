import 'package:flutter/material.dart';
import 'package:my_webapp/pages/contacts/phone/phone_contacts.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        switch(constraints.maxWidth) {
        case < 600: return const ContactsPhone();
        case < 1000: return const SizedBox();
        case < 1500: return const SizedBox();
        default: return Container();
      }
      },),
    );
  }
}

