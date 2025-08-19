import 'package:flutter/material.dart';
import 'package:news_route_app/model/SourceResponse.dart';
import 'package:news_route_app/ui/category_details/news/news_widget.dart';
import 'package:news_route_app/ui/category_details/source/source_name.dart';

import '../../../model/category.dart';
import '../../../utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourceList;
  Category category;

  SourceTabWidget(
      {super.key, required this.sourceList, required this.category});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              isScrollable: true,
                indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
                dividerColor: AppColors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.sourceList.map((source){
              return SourceName(
                  source: source,
                  isSelected: selectedIndex == widget.sourceList.indexOf(source));
    },).toList()),
            SizedBox(height: height*0.02,),
            Expanded(
                child: NewsWidget(
                  source: widget.sourceList[selectedIndex],
                  category: widget.category,))
          ],
        ));
  }
}
