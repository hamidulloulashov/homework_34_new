import 'package:flutter/material.dart';
import 'package:homework_34/core/utils/app_colors.dart';
import 'package:homework_34/features/add_recipeis/widgets/delate_add_resipe.dart';
import 'package:homework_34/features/add_recipeis/widgets/publish_add_resipe.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
class AddResipeisPage extends StatefulWidget {
  @override
  _RecipeCreatorPageState createState() => _RecipeCreatorPageState();
}
class _RecipeCreatorPageState extends State<AddResipeisPage>
    with TickerProviderStateMixin {
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cookTimeController = TextEditingController();

  List<Map<String, TextEditingController>> ingredients = [
    {
      'amount': TextEditingController(),
      'name': TextEditingController(),
    }
  ];
  List<TextEditingController> instructions = [TextEditingController()];
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    
    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _recipeNameController.dispose();
    _descriptionController.dispose();
    _cookTimeController.dispose();
    
    for (var ingredient in ingredients) {
      ingredient['amount']?.dispose();
      ingredient['name']?.dispose();
    }
    
    for (var instruction in instructions) {
      instruction.dispose();
    }
    
    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      ingredients.add({
        'amount': TextEditingController(),
        'name': TextEditingController(),
      });
    });
  }

  void _removeIngredient(int index) {
    if (ingredients.length > 1) {
      setState(() {
        ingredients[index]['amount']?.dispose();
        ingredients[index]['name']?.dispose();
        ingredients.removeAt(index);
      });
    }
  }

  void _addInstruction() {
    setState(() {
      instructions.add(TextEditingController());
    });
  }

  void _removeInstruction(int index) {
    if (instructions.length > 1) {
      setState(() {
        instructions[index].dispose();
        instructions.removeAt(index);
      });
    }
  }

  void _saveRecipe() {
    Map<String, dynamic> recipe = {
      'name': _recipeNameController.text.isEmpty 
          ? 'Untitled Recipe' 
          : _recipeNameController.text,
      'description': _descriptionController.text.isEmpty 
          ? 'No description' 
          : _descriptionController.text,
      'cookTime': _cookTimeController.text.isEmpty 
          ? 'Not specified' 
          : _cookTimeController.text,
      'ingredients': ingredients
          .where((ing) => ing['amount']!.text.isNotEmpty || ing['name']!.text.isNotEmpty)
          .map((ing) => {
                'amount': ing['amount']!.text,
                'name': ing['name']!.text,
              })
          .toList(),
      'instructions': instructions
          .where((inst) => inst.text.isNotEmpty)
          .map((inst) => inst.text)
          .toList(),
    };

    print('Recipe saved: $recipe');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Recipe saved successfully!'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(color: Colors.black87, fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Color(0xFFFFB6C1).withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15, top: 10),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Color(0xFFFF6B6B),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildIngredientRow(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildCustomTextField(
              controller: ingredients[index]['amount']!,
              hintText: 'Amount',
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: _buildCustomTextField(
              controller: ingredients[index]['name']!,
              hintText: 'Ingredient name',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => _removeIngredient(index),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xFFFF4757),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionRow(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Color(0xFFFF6B6B),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: _buildCustomTextField(
              controller: instructions[index],
              hintText: 'Step ${index + 1} instructions...',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => _removeInstruction(index),
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFF4757),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF6B6B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 5,
        ),
        child: Text(text, style: TextStyle(fontSize: 14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: "Create Recipe",arrow: "assets/arrow.png",),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            decoration: BoxDecoration(
             
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PublishAddResipe(),
    );
  },
                          child: Container(
                            width: 177,
                            height: 27,
                            decoration: BoxDecoration(
                              color: AppColors.container,
                              borderRadius: BorderRadius.circular(14)
                            ),
                            child: Center(
                              child: Text(
                                'Publish',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        GestureDetector(
                            onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DelateAddResipe(),
    );
  },
                          child: Container(
                            width: 177,
                            height: 27,
                          
                            decoration: BoxDecoration(
                               color: AppColors.container,
                              borderRadius: BorderRadius.circular(14)
                            ),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  'Delete',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                   
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 20,),
            
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Image.asset("assets/ananas.png", width: 362,height: 281,)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            _buildSectionTitle('Title'),
                            _buildCustomTextField(
                              controller: _recipeNameController,
                              hintText: 'Pina Colada',
                            ),
                            
                      
                            _buildSectionTitle('Description'),
                            _buildCustomTextField(
                              controller: _descriptionController,
                              hintText: 'A tropical explosion in every sip',
                            ),
                            
                         
                         
                            _buildSectionTitle('Time Recipe'),
                            _buildCustomTextField(
                              controller: _cookTimeController,
                              hintText: '30min',
                            ),
                            
                       
                            _buildSectionTitle('Ingredients'),
                            ...ingredients
                                .asMap()
                                .entries
                                .map((entry) => _buildIngredientRow(entry.key)),
                            _buildAddButton('+ Add Ingredient', _addIngredient),
                            
                            SizedBox(height: 20),
                            
                    
                            _buildSectionTitle('Instructions'),
                            ...instructions
                                .asMap()
                                .entries
                                .map((entry) => _buildInstructionRow(entry.key)),
                            _buildAddButton('+ Add Step', _addInstruction),
                            
                            SizedBox(height: 30),
                            
                                  ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}