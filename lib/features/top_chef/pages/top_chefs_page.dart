import 'package:flutter/material.dart';
import 'package:homework_34/core/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/core/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:homework_34/core/utils/theme/colors.dart';
import '../widgets/most_widget.dart';
import '../managers/most_view_top_chef_model.dart';

class TopChefs extends StatefulWidget {
  const TopChefs({super.key});

  @override
  State<TopChefs> createState() => _TopChefsState();
}

class _TopChefsState extends State<TopChefs> {
  @override
  void initState() {
    super.initState();
    context.read<MostViewTopChefModel>().loadChefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Top chefs", arrow: 'assets/arrow.png',first: 'assets/notifaction.png',second: 'assets/search.png',containerColor: AppColors.container,),
      body: const MostWidget(),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
