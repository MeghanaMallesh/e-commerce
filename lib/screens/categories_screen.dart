import 'package:flutter/material.dart';
import 'package:myapp/widgets/category_items.dart';

import '../dummy_data.dart';

class CategoriesScreens extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  GridView(
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItems(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
            //  crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        );
  }
}
