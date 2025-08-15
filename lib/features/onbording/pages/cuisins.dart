// import 'package:flutter/material.dart';
// import 'package:homework_34/core/utils/theme/app_theme.dart';
// import 'package:homework_34/features/onbording/managers/cusins_view_model.dart';
// import 'package:homework_34/features/onbording/pages/allergic.dart';
// import 'package:provider/provider.dart';

// class Cuisins extends StatelessWidget {
//   const Cuisins({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CusinsViewModel(),
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
//             padding: const EdgeInsets.only(top: 20),
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
//                   left: 85,
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
//                 "Select your cuisines preferences",
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
//                 "Please select your cuisines preferences for a\nbetter recommendations or you can skip it.",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Consumer<CusinsViewModel>(
//                 builder: (context, vm, child) => GridView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 0.90,
//                   ),
//                   itemCount: vm.cusins.length,
//                   itemBuilder: (context, index) => Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.network(
//                           vm.cusins[index].image,
//                           width: 99,
//                           height: 99,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         vm.cusins[index].title,
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
//                     color: AppColors.container,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Skip",
//                       style: TextStyle(
//                         color: AppColors.text,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Allergic()),
//                     );
//                   },
//                   child: Container(
//                     width: 162,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(23),
//                       color: AppColors.text,
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Continue",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                         ),
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
