// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../theme/drawer_tile.dart';
// import '../blocs/translation_bloc.dart';
// import '../translation.dart';

// class LanguageSwitcherTile extends StatefulWidget {
//   @override
//   _LanguageSwitcherTileState createState() => _LanguageSwitcherTileState();
// }

// class _LanguageSwitcherTileState extends State<LanguageSwitcherTile> {
//   TranslationBloc _translationBloc;

//   @override
//   void initState() {
//     super.initState();

//     _translationBloc = BlocProvider.of<TranslationBloc>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TranslationBloc, TranslationState>(
//       builder: (context, state) {
//         return Padding(
//           padding: EdgeInsets.only(bottom: 12),
//           child: DrawerTile(
//             icon: Icons.language,
//             title: translation.of("user.switch_to"),
//             subTitle: translation.isArabic ? "English" : "عربي",
//             onTap: () {
//               if (translation.isArabic) {
//                 _translationBloc.add(ChangeLanguage(
//                   language: "en",
//                   save: true,
//                 ));
//               } else {
//                 _translationBloc.add(ChangeLanguage(
//                   language: "ar",
//                   save: true,
//                 ));
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
