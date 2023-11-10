import 'package:flutter/material.dart';

class AnimationW extends StatefulWidget {
  const AnimationW({super.key});

  @override
  State<AnimationW> createState() => _AnimationWState();
}

class _AnimationWState extends State<AnimationW> with TickerProviderStateMixin {
  double x = 100;
  double y = 100;
  double z = 1;
  Color color = Colors.red;
  CrossFadeState fade = CrossFadeState.showFirst;
  Widget change = const Icon(Icons.done);
  void anime() {
    if (fade == CrossFadeState.showSecond) {
      contr.repeat();
      fade = CrossFadeState.showFirst;
      change = const Icon(Icons.done);
    } else {
      contr.forward();
      fade = CrossFadeState.showSecond;
      change = const Icon(Icons.home);
    }
    setState(() {
      
    });
  }
  @override
  void initState() {
    contr = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.initState();
  }
  late final AnimationController contr;
  late Animation<Decoration> animetion = DecorationTween(begin: const BoxDecoration(borderRadius: BorderRadius.all(Radius.zero), color: Colors.amber), end: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.red)).animate(contr);
  Alignment alig = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => anime(),),
      body: const Center(
        
      )
    );
  }
}


// неявная анимация - implicitlyAnimatedWidgets;

// AnimatedContainer - анимирует все свои свойства
// AnimatedPadding - анимирует падинг своего ребенка
// AnumatedScale - анимированное увеленчение размера ребенка
// AnimatedCrossFade - анимирует смену двух виджетов (работает не ровно, особенно если разные виджеты разных размеров)
// TweenAnimationBuilder - анимирует ребенка с помощью вложенных свойств анимации позволяя создать кастомную анимацию без инициализации контроллеров и т.д.

// явная анимация - AnimatedWidgets (transitions);

// FadeTransition - анимация с opacity
// RotationTransition - анимация с rotation
// SlideTransition - анимация с изменением позиции

// all of tranzitions and animatedBuilder();