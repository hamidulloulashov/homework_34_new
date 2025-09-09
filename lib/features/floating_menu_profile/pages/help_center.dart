import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int selectedIndex = 0;

  final List<String> tabs = ['FAQ', 'Contact Us'];
  final List<String> subTabs = ['General', 'Account', 'Services'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: CustomAppBar(
  arrow: "assets/arrow.png",
  title: "Help Center",
 ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0 ? AppColors.text: AppColors.container,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                        'FAQ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1 ? const Color(0xFFFF6B6B) : const Color(0xFFFFB3BA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          if (selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildSubTab('General', true),
                  const SizedBox(width: 8),
                  _buildSubTab('Account', false),
                  const SizedBox(width: 8),
                  _buildSubTab('Services', false),
                ],
              ),
            ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color:AppColors.container,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Row(
                children: [
                  Icon(Icons.search, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Search',
                    style: TextStyle(
                      color:Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: selectedIndex == 0 ? _buildFAQContent() : _buildContactContent(),
            ),
          ),

          
        ],
      ),
    );
  }

  Widget _buildSubTab(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF6B6B) : const Color(0xFFFFB3BA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style:  TextStyle(
          color: Theme.of(context).colorScheme.inverseSurface,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildFAQContent() {
    final faqItems = [
      'Lorem ipsum dolor sit amet?',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet et dolore?',
      'Lorem ipsum dolor sit amet?',
      'Lorem ipsum dolor sit amet et dolore?',
      'Lorem ipsum dolor ut labore et dolore?',
      'Lorem ipsum dolor sit amet?',
      'Lorem ipsum dolor sit amet?',
      'Lorem ipsum dolor sit amet ut dolore?',
      'Lorem ipsum dolor sit amet?',
      'Lorem ipsum dolor sit labore et dolore?',
    ];

    return ListView.builder(
      itemCount: faqItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Expanded(
                child: Text(
                  faqItems[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 14,
                  ),
                ),
              ),
             Image.asset("assets/pause.png", width: 11, height: 15,),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactContent() {
    final contactItems = [
      {'icon': Icons.language, 'text': 'Website'},
      {'icon': Icons.facebook, 'text': 'Facebook'},
      {'icon': Icons.message, 'text': 'WhatsApp'},
      {'icon': Icons.camera_alt, 'text': 'Instagram'},
    ];
    return ListView.builder(
      itemCount: contactItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: AppColors.text),
                  child: Icon(
                    contactItems[index]['icon'] as IconData,
                    color: Theme.of(context).colorScheme.inverseSurface,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    contactItems[index]['text'] as String,
                    style:  TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                 Image.asset("assets/pause.png", width: 11, height: 15,),
              ],
            ),
        );
      },
    );
  }
}