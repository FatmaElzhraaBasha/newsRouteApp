import 'package:flutter/material.dart';
import 'package:news_route_app/ui/category_details/news/news_item.dart';
import 'package:news_route_app/ui/category_details/news/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../model/SourceResponse.dart';
import '../../../model/category.dart';
import '../../../utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  Category category;

  NewsWidget({super.key, required this.source, required this.category});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            //todo: error
            return Column(
              children: [
                Text(viewModel.errorMessage!,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.please_try_again,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ),
              ],
            );
          }
          if (viewModel.newsList == null) {
            //todo: loading
            return const Center(
              child: CircularProgressIndicator(color: AppColors.grey),
            );
          } else {
            //todo: success
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02,);
              },
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList!.length,);
          }
        },
      ),
      // FutureBuilder<NewsResponse?>(
      //   future: ApisManager.getNewsBySourceId(widget.source.id ?? ''),
      //     builder: (context, snapshot) {
      //       //todo: loading
      //       if(snapshot.connectionState == ConnectionState.waiting){
      //         return Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.grey,
      //           ),
      //         );
      //       }
      //       //todo: error => client
      //       else if(snapshot.hasError){
      //         return Column(
      //           children: [
      //             Text(AppLocalizations.of(context)!.something_went_wrong,
      //               style: Theme
      //                   .of(context)
      //                   .textTheme
      //                   .labelMedium,),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                   backgroundColor: AppColors.grey
      //               ),
      //               onPressed: (){
      //                 ApisManager.getNewsBySourceId(widget.source.id ?? '');
      //                 setState(() {
      //
      //                 });
      //               },
      //               child: Text(AppLocalizations.of(context)!.please_try_again,
      //                 style: Theme
      //                     .of(context)
      //                     .textTheme
      //                     .labelMedium,),)
      //           ],
      //         );
      //       }
      //
      //       //todo: serverResponse => Error
      //       if(snapshot.data?.status != 'ok'){
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!,
      //               style: Theme.of(context).textTheme.labelMedium,),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                   backgroundColor: AppColors.grey
      //               ),
      //               onPressed: (){
      //                 ApisManager.getSources(widget.category.id);
      //                 setState(() {
      //
      //                 });
      //               },
      //               child: Text(AppLocalizations.of(context)!.please_try_again,
      //                 style: Theme.of(context).textTheme.labelMedium,),)
      //           ],
      //         );
      //       }
      //       //todo: serverResponse => Success
      //       var newsList = snapshot.data?.articles ?? [];
      //       return ListView.separated(
      //         separatorBuilder: (context, index) {
      //           return SizedBox(height: height*0.02,);
      //         },
      //         itemBuilder: (context, index) {
      //           return NewsItem(news: newsList[index]);
      //         },
      //         itemCount: newsList.length,);
      //     },),
    );
  }
}
