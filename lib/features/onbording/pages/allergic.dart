// import 'package:flutter/material.dart';
// import 'package:homework_34/core/utils/theme/app_theme.dart';
// import 'package:provider/provider.dart';
// import 'package:homework_34/features/onbording/managers/allergic_vew_model.dart';

// class Allergic extends StatelessWidget {
//   const Allergic({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => AllergicVewModel(),
//       builder: (context, child) => Scaffold(
//         backgroundColor: AppColors.primary,
//         appBar: AppBar(
//           backgroundColor: AppColors.primary,
//           elevation: 0,
//           leading: IconButton(
//             icon: Image.asset("assets/arrow.png", width: 30, height: 14),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Padding(
//             padding: const EdgeInsets.only(top: 25),
//             child: Stack(
//               children: [
//                 Container(
//                   width: 230,
//                   height: 12,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                   ),
//                 ),
//                 Positioned(
//                   left: 165,
//                   child: Container(
//                     width: 65,
//                     height: 12,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.text,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 "¿You have any allergic?",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 "Lorem ipsum dolor sit amet consectetur. Leo ornare\nullamcorper viverra ultrices in.",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Consumer<AllergicVewModel>(
//                 builder: (context, vm, child) => GridView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                   ),
//                   itemCount: vm.allergic.length,
//                   itemBuilder: (context, index) => Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.network(
//                           vm.allergic[index].image,
//                           width: 99,
//                           height: 99,
//                           fit: BoxFit.cover,
//                         ),
//                       ),

//                       Text(
//                         vm.allergic[index].title,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 162,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(23),
//                     color: AppColors.text,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Continue",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
