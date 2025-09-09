import 'package:flutter/material.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}
class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'French',
    'Germany',
    'Italian',
    'Korean',
    'Hindi',
    'Arabic',
    'Russia',
    'Spanish',
    'Gujarati',
    'Bengali',
    'Hebrew',
    'Urdu',
    'Ukrainian',
    'Dutch',
    'Uzbek',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
    appBar: CustomAppBar(
arrow: "assets/arrow.png",
title: "Language",
    ),
      body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return ForLanguage(
                      text: languages[index],
                      isActive: selectedLanguage == languages[index],
                      onTap: () {
                        setState(() {
                          selectedLanguage = languages[index];
                        });
                      },
                    );
                  },
                ),
              ),

              
            ],
          ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}

class ForLanguage extends StatelessWidget {
  const ForLanguage({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.text,
  });

  final VoidCallback onTap;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFF6B6B),
                  width: 2,
                ),
              ),
              child: Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isActive ? const Color(0xFFFF6B6B) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style:  TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

