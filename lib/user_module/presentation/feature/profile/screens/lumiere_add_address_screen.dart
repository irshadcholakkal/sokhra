// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../../../../base_module/domain/entity/color_scheme.dart';
//
// class NewAddAddressScreen extends StatefulWidget {
//   const NewAddAddressScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewAddAddressScreen> createState() => _NewAddAddressScreenState();
// }
//
// class _NewAddAddressScreenState extends State<NewAddAddressScreen> {
//   late CameraPosition cameraPosition;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColorScheme.backgroundColorLight,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(
//             Icons.arrow_back_ios_new,
//             color: AppColorScheme.onBackgroundLight,
//           ),
//         ),
//         title: Text("Confirm map pin location"),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Card(
//             child: Container(),
//           ),
//           GoogleMap(initialCameraPosition: cameraPosition)
//         ],
//       ),
//     );
//   }
// }
