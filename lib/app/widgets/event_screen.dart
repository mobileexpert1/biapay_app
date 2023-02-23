

import 'event_tile.dart';
import 'export_file.dart';

class EventScreen extends StatelessWidget {
  final String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM506xrpS_av_FDNanDLwh1CVNHDUGnfvcYw&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BiaAppBar(),
      body: ListView(
        children: [
          EventTile(title: 'Event 1', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 2', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 3', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 4', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 5', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 6', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 7', image: image, dateTime: DateTime.now()),
          EventTile(title: 'Event 8', image: image, dateTime: DateTime.now()),
        ],
      ),
    );
  }
}
