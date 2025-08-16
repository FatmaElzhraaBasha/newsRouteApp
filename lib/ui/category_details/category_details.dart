import 'package:flutter/material.dart';
import 'package:news_route_app/apis/apis_manager.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/ui/category_details/source/source_tab_widget.dart';

import '../../utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApisManager.getSources(),
        builder: (context, snapshot) {
          //todo: loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.grey,
              ),
            );
          }
          //todo: error => client
          else if (snapshot.hasError) {
            return Column(
              children: [
                Text(AppLocalizations.of(context)!.something_went_wrong,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey
                  ),
                  onPressed: (){
                    ApisManager.getSources();
                    setState(() {

                    });
                  },
                  child: Text(AppLocalizations.of(context)!.please_try_again,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,),)
              ],
            );
          }
          //todo: serverResponse => Error
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey
                  ),
                  onPressed: (){
                  ApisManager.getSources();
                  setState(() {

                  });
                },
                  child: Text(AppLocalizations.of(context)!.please_try_again,
                    style: Theme.of(context).textTheme.labelMedium,),)
              ],
            );
          }
          //todo: serverResponse => Success
          var sourceList = snapshot.data?.sources ?? [];
          return SourceTabWidget(sourceList: sourceList);



        },);
  }
}
