import 'package:flutter/material.dart';

class DrawerAnimation extends StatefulWidget {
  const DrawerAnimation({super.key});

  @override
  State<DrawerAnimation> createState() => _DrawerAnimationState();
}

class _DrawerAnimationState extends State<DrawerAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(leading: Builder(
        builder: (context) {
          return IconButton(icon: const Icon(Icons.menu), onPressed: () {
            context.findAncestorStateOfType<ScaffoldState>()!.openDrawer();
          },);
        }
      ),),
      drawer: const _DrawerWidget(),
      body: const Center(child: Icon(Icons.home))
    );
  }
}



class _DrawerWidget extends StatefulWidget {
  const _DrawerWidget();

  @override
  State<_DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<_DrawerWidget> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
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
    return Transform(
      transform: Matrix4.rotationY(1),
      child: Drawer(
        backgroundColor: Colors.grey,
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => print('push'),
                    child: SlideTransition(
                      position: Tween<Offset>(begin: const Offset(-1,0), end: const Offset(0,0)).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
                      child: Ink(color: Colors.amber, height: 20,))),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: () => print('push'),
                    child: SlideTransition(
                      position: Tween<Offset>(begin: const Offset(-1,0), end: const Offset(0,0)).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
                      child: Ink(color: Colors.amber, height: 20,),),),
                  const SizedBox(height: 10,),
                
                ],
              ),
            )
         
      ),
    );
  }
}
