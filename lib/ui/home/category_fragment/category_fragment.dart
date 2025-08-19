import 'package:flutter/material.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/model/category.dart';
import 'package:news_route_app/ui/home/category_fragment/widget/category_item.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  List<Category> categoriesList = [];
  OnCategoryItemClick onCategoryItemClick;

  CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoriesList = Category.getCategoryList(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${AppLocalizations.of(context)!.good_morning}\n${AppLocalizations.of(context)!.some_news}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: show category details
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
