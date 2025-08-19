import 'package:flutter/material.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_Language_Provider.dart';
import '../../../../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  bool isRight;
  int index;

  CategoryItem({
    super.key,
    required this.category,
    this.isRight = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Container(
      height: height * 0.23,
      width: width * 0.9,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.image),
          alignment: (index % 2 == 0)
              ? Alignment.centerLeft
              : Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).canvasColor,
      ),
      child: Stack(
        alignment: (index % 2 == 0)
            ? Alignment.centerRight
            : Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.01,
                  ),
                  padding: (index % 2 == 0)
                      ? EdgeInsetsDirectional.only(start: width * 0.02)
                      : EdgeInsetsDirectional.only(end: width * 0.02),
                  width: width * 0.42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(84),
                    color: AppColors.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: (index % 2 == 0)
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.view_all,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          (index % 2 == 0)
                              ? Icons.arrow_forward_ios_rounded
                              : Icons.arrow_back_ios_new_rounded,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
