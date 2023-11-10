import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_webapp/pages/item_page/widgets/page_view_item.dart';
import 'package:my_webapp/pages/item_page/widgets/time_widget.dart';
import '../../../favorite/view/stars_view.dart';
import '../../../search/view/search_bloc/blok.dart';
import '../../../weather/view/weather_widget.dart';
import 'custom_clipper.dart';
import 'hotel_rooms.dart';

class ImageItemWidget extends StatelessWidget {
  
  const ImageItemWidget({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/4,
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipPath(
            clipper: MyCustormClipper(),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(0, 0))), 
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (previous, current) => previous.model.item != current.model.item,
                  builder: (context, state) {
                    final images = state.model.item.images;
                    return PageViewItem(images: images,);
                  }
                ),
            ),
          ),
          Positioned(
            right: 15,
            child: BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) => previous.model.item.workTime != current.model.item.workTime,
              builder: (context, state) {
                final time = state.model.item.workTime;
                return OpenClosedWidget(time: time,);
              }
            )),
          const Positioned(
            right: 15,
            child: WeatherWidget()),
          const Positioned(
            bottom: 5,
            right: 5,
            child: SizedBox(width: 50, height: 50, child: StarsFavorite(),) // or icons.star;
            ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: SizedBox(child: HotelRooms()) // or icons.star;
            ),
        ],
      ),
    );
  }
}





