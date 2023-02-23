// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import '../../../../common/biapay_ui_package.dart';

// class PlayTutorials extends StatefulWidget {
//   const PlayTutorials({Key? key}) : super(key: key);

//   @override
//   _PlayTutorialsState createState() => _PlayTutorialsState();
// }

// class _PlayTutorialsState extends State<PlayTutorials> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       hasSidePadding: false,
//       appBar: BiaAppBar.simple('Tutorials'),
//       body: Container(
//         // margin: EdgeInsets.only(bottom: 100.h, top: 100.h),
//         // padding: EdgeInsets.all(20.h),
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           //  color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15),
//             topLeft: Radius.circular(15),
//             bottomRight: Radius.circular(15),
//             bottomLeft: Radius.circular(15),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _controller.value.isInitialized
//                 ? GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                     child: AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     ),
//                   )
//                 : Container(),
//             SizedBox(
//               height: 30.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 0),
//               child: const BiaText(
//                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
//                 ' Mauris ac est diam. Proin quis vulputate nunc. ',
//                 fontSize: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
