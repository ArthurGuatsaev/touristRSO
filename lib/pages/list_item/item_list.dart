import 'package:flutter/material.dart';
import 'package:my_webapp/general/domain/model/general_model.dart';
import 'package:my_webapp/general/view/block/blok.dart';
import 'package:my_webapp/pages/list_item/widgets/appbar_list_item.dart';
import 'package:my_webapp/pages/list_item/widgets/list_item_layout.dart';
import 'package:my_webapp/search/data/data_search_repository.dart';
import 'package:my_webapp/search/view/search_bloc/blok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatelessWidget {
  final PlaceCategory category;
  static const String routeName = '/item_list';
  static Route route(PlaceCategory category) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: ItemList.routeName),
      builder: (context) => BlocBuilder<GeneralBloc, GeneralState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
                repository: DataSearchRepository(
                    initialList: state.model.currentPlaces,
                    tegs: state.model.tags)),
            child: ItemList(
              category: category,
            ),
          );
        },
      ),
    );
  }

  const ItemList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(), // походу нужно заменить на sliver аррбар чтобы исчезал при прокрутке (в прокрутке грида)
      body: const ListLayautBuilder(),
    );
  }
}

// OverlayEntry? overlayEntry;
// showOverlay(BuildContext context, RenderBox? render) async {
//   if (render == null) return;
//   print(render.runtimeType);
//   final offset = render.localToGlobal(Offset.zero);
//   OverlayState? overlayState = Overlay.of(context);

//   overlayEntry = OverlayEntry(builder: (context) {
//     return Positioned(child: CompositedTransformFollower(
//       link: layerLink,
//       child: ClipRRect(child: Material(child: Container(color: Colors.amber, width: 100, height: 100,)),)), left: offset.dx, top: offset.dy,);
//   });
//   overlayState.insert(overlayEntry!);
// }

// final LayerLink layerLink = LayerLink();

final GlobalKey global = GlobalKey();



// class PullScrollable extends StatefulWidget {
//   final Widget child;
//   final Function onPull;
//   const PullScrollable({super.key, required this. child, required this.onPull});

//   @override
//   State<PullScrollable> createState() => _PullScrollableState();
// }

// class _PullScrollableState extends State<PullScrollable> {
//   final double kDragTriggerDelta = 15;
//   @override
//   Widget build(BuildContext context) {
//     bool isDragFromEdge = useState(false);
//     bool getIsDragFromEdge(ScrollStartNotification notification) {
//       return notification.metrics.extentBefore == 0.0 && isDragFromEdge == false;
//     }
//     bool handleDragFromEdge() {
//       isDragFromEdge = true;
//       return false;
//     }
//     bool handleDragEnd() {
//       isDragFromEdge = false;
//       return false;
//     }
//     bool getIsOverscroll(ScrollNotification notification) {
//       if (!isDragFromEdge) return false;
//       if ((notification is ScrollUpdateNotification && (notification.dragDetails?.primaryDelta ?? 0) > kDragTriggerDelta) || (notification is OverscrollNotification && (notification.dragDetails?.primaryDelta ?? 0) > kDragTriggerDelta)) {
//         return true;
//       }
//       return false;
//     }
//     bool handleOverscroll() {
//       widget.onPull();
//       isDragFromEdge = false;
//       return false;
//     }
//     return NotificationListener<ScrollNotification>(child: widget.child, onNotification: (notification) {
//       if (notification is ScrollStartNotification && getIsDragFromEdge(notification)) handleDragFromEdge();
//       if (notification is ScrollEndNotification) handleDragEnd();
//       if (getIsOverscroll(notification)) handleOverscroll();
//       return false;
//     },);
//   }
  
//   bool useState(bool bool) {
//     return false;
//   }
// }
// class ListsView extends StatelessWidget {
//   const ListsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PullScrollable(child: ListView(children: [
//       Container(height: 100, width: 100, color: Colors.black,),
//       Container(height: 100, width: 100, color: Colors.grey,),
//       Container(height: 100, width: 100, color: Colors.orange,),
//       Container(height: 100, width: 100, color: Colors.black,),
//       Container(height: 100, width: 100, color: Colors.grey,),
//       Container(height: 100, width: 100, color: Colors.orange,),
//       Container(height: 100, width: 100, color: Colors.black,),
//       Container(height: 100, width: 100, color: Colors.grey,),
//       Container(height: 100, width: 100, color: Colors.orange,),
//       Container(height: 100, width: 100, color: Colors.black,),
//       Container(height: 100, width: 100, color: Colors.grey,),
//       Container(height: 100, width: 100, color: Colors.orange,),
      
//       ]
//     ), onPull: () {
//       showSearch(context: context, delegate: MyDelegateSearch());
//     });
//   }
// }

// class MyDelegateSearch extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }

// }