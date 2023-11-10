import 'package:flutter/material.dart';
import 'package:my_webapp/pages/menu_page/widgets/user_widget.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2500));
  @override
  void initState() {
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: UserWidget(),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          MenuItem(
            title: 'afisha',
            routeName: '/afisha',
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          MenuItem(
            title: 'map',
            routeName: '/map',
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          MenuItem(
            title: 'contacts',
            routeName: '/contacts',
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          MenuItem(
            title: 'favorite',
            routeName: '/favorite',
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final AnimationController controller;
  final String title;
  final String routeName;
  const MenuItem(
      {super.key,
      required this.title,
      required this.routeName,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Ink(
          color: Colors.blue,
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: controller, curve: Curves.elasticOut)),
            child: Row(
              children: [const Icon(Icons.home), Text(title)],
            ),
          ),
        ));
  }
}
