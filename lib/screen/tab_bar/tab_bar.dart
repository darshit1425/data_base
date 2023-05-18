// import 'package:all_in_one_store/screen/education_screen/view/education_screen.dart';
// import 'package:all_in_one_store/screen/food_screen/view/food_crenn.dart';
// import 'package:all_in_one_store/screen/ott_screen/view/ott_screen.dart';
// import 'package:all_in_one_store/screen/shopping_screen/view/shopping_screen.dart';
// import 'package:all_in_one_store/screen/social_screen/view/social_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:provider/provider.dart';
//
// import '../../screen/home_screen/provider/home_provider.dart';
// import '../../screen/home_screen/view/home_screen.dart';
//
// class Tab_Screen extends StatefulWidget {
//   const Tab_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Tab_Screen> createState() => _Tab_ScreenState();
// }
//
// class _Tab_ScreenState extends State<Tab_Screen> {
//   Home_provider? homeProviderF;
//   Home_provider? homeProviderT;
//
//   @override
//   Widget build(BuildContext context) {
//     homeProviderF = Provider.of<Home_provider>(context, listen: false);
//
//     homeProviderT = Provider.of<Home_provider>(context, listen: true);
//     return SafeArea(
//       child: DefaultTabController(
//         length: 6,
//         child: SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.red.shade50,
//             appBar: AppBar(
//               centerTitle: true,
//               leading: Icon(Icons.search_outlined),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '');
//                       },
//                       icon: Icon(Icons.store),
//                       color: Colors.white),
//                 ),
//               ],
//               elevation: 0,
//               title: Text(
//                 "All in one",
//                 style: GoogleFonts.lato(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Colors.white),
//               ),
//               bottom: TabBar(
//                 indicatorColor: Colors.white,
//                 isScrollable: true,
//                 // labelColor: Colors.black,
//
//                 tabs: [
//                   Tab(
//                     child: Text(
//                       "Payments",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Shopping",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Food",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Education",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "OTT",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       "Social media",
//                       style: GoogleFonts.lato(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // backgroundColor: Colors.deepPurple.shade300,
//               backgroundColor: Colors.black,
//             ),
//             body: TabBarView(
//               children: [
//                 // Home_Screen(),
//                 // Shopping_Screen(),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }