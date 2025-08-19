import 'package:flutter/material.dart';
import 'package:news_route_app/apis/apis_manager.dart';
import 'package:news_route_app/model/NewsResponce.dart';
import 'package:news_route_app/ui/category_details/news/news_item.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../model/SourceResponse.dart';
import '../../../model/category.dart';
import '../../../providers/app_Language_Provider.dart';
import '../../../utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  Category category;

  NewsWidget({super.key, required this.source, required this.category});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return FutureBuilder<NewsResponse?>(
      future: ApisManager.getNewsBySourceId(widget.source.id ?? '',
          languageProvider.appLanguage),
        builder: (context, snapshot) {
          //todo: loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.grey,
              ),
            );
          }
          //todo: error => client
          else if(snapshot.hasError){
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
                    ApisManager.getNewsBySourceId(widget.source.id ?? '',
                        languageProvider.appLanguage);
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
                    ApisManager.getSources(widget.category.id,
                        languageProvider.appLanguage);
                    setState(() {

                    });
                  },
                  child: Text(AppLocalizations.of(context)!.please_try_again,
                    style: Theme.of(context).textTheme.labelMedium,),)
              ],
            );
          }
          //todo: serverResponse => Success
          var newsList = snapshot.data?.articles ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: height*0.02,);
            },
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,);
        },);
  }
}
