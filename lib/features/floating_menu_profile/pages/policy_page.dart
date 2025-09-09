import 'package:flutter/material.dart';
import 'package:homework_34/features/common/widgets/bottom_navigator_widget.dart';
import 'package:homework_34/features/common/widgets/custom_appbar_widget.dart';
class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
     appBar: CustomAppBar(
      title: "Privacy Policy",
      arrow: "assets/arrow.png",
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Est fugiat assumenda aut reprehenderit',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              Text(
            '''Lorem ipsum dolor sit amet. Et odio officia aut voluptate internos est omnis vitae ut architecto sunt non tenetur fuga ut provident vero. Quo aspernatur facere et consectetur ipsum et facere corrupti est asperiores facere. Est fugiat assumenda aut reprehenderit voluptatem sed
        
            Aut quidem accusantium nam alias autem eum officiis placeat et omnis autem id officiis perspiciatis qui corrupti officia eum aliquam provident. Eum voluptas error et optio dolorum cum molestiae nobis et odit molestiae quo magnam impedit sed fugiat nihil non nihil vitae.
        
            1.Ea voluptates omnis aut sequi sequi.
            2.Est dolore quae in aliquid ducimus et autem repellendus.
            3.Aut ipsum Quis qui porro quasi aut minus placeat!
            4.Sit consequatur neque ab vitae facere.
        
            Et odio officia aut voluptate internos est omnis vitae ut architecto sunt non tenetur fuga ut provident vero. Quo aspernatur facere et consectetur ipsum et facere corrupti est asperiores facere. Est fugiat assumenda aut reprehenderit voluptatem sed.
        
            Aut fuga sequi eum voluptatibus provident.
            Eos consequuntur voluptas vel amet eaque aut dignissimos velit.
            Vel exercitationem quam vel eligendi rerum
        
            At harum obcaecati et nostrum beatae? Ea accusantium dolores qui rerum aliquam est perferendis mollitia et ipsum ipsa qui enim autem At corporis sunt. Aut odit quisquam est reprehenderit itaque aut accusantium dolor qui neque repellat.
        
            Eum voluptas error et optio dolorum cum molestiae nobis et odit molestiae quo magnam impedit sed fugiat nihil non nihil vitae.
        
            Quo aspernatur facere et consectetur ipsum et facere corrupti est asperiores facere. Est fugiat assumenda aut reprehenderit voluptatem sed.''',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color:Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorNews(),
    );
  }
}
