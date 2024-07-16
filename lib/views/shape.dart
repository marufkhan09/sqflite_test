// import 'dart:io';

// import 'package:adeffi/constants/colors.dart';
// import 'package:adeffi/constants/image_path.dart';
// import 'package:adeffi/router/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   final bool image;
//   final bool notification;
//   final bool edit;
//   final bool menu;
//   const CustomAppBar(
//       {super.key,
//       required this.notification,
//       required this.menu,
//       required this.image,
//       required this.edit,
//       required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       centerTitle: !image ? true : false,
//       leading: menu
//           ? IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {},
//             )
//           : null,
//       title: image
//           ? Image.asset(
//               ImagePaths.appbarLogo,
//               width: 120,
//             )
//           : title != ""
//               ? Text(
//                   title,
//                   style: GoogleFonts.raleway(
//                     color: ProjectColors.textblack,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               : null,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [ProjectColors.blue, ProjectColors.violet],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: Platform.isAndroid ? 28 : 56),
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20)),
//                   color: ProjectColors.white),
//             )
//           ],
//         ),
//       ),
//       actions: [
//         notification
//             ? InkWell(
//                 onTap: () {
//                   // Handle search button press
//                 },
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       ImagePaths.noti,
//                       height: 20,
//                       width: 20,
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 2,
//                       child: Container(
//                         height: 10,
//                         width: 10,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [ProjectColors.violet, ProjectColors.blue],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Text(
//                           '2',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.raleway(
//                             color: Colors.white,
//                             fontSize: 7,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             : edit
//                 ? InkWell(
//                     onTap: () {
//                       // Handle search button press
//                       context.goNamed(Routes.accounteditpage);
//                     },
//                     child: Image.asset(
//                       ImagePaths.pen,
//                       height: 20,
//                       width: 20,
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//         const SizedBox(
//           width: 16,
//         )
//       ],
//     );
//   }
// }