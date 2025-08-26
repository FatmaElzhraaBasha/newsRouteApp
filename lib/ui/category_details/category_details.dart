import 'package:flutter/material.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/model/category.dart';
import 'package:news_route_app/ui/category_details/source/source_tab_widget.dart';
import 'package:news_route_app/ui/category_details/sources_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.please_try_again,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            );
          }
          if (viewModel.sourcesList == null) {
            //todo: loading
            return const Center(
              child: CircularProgressIndicator(color: AppColors.grey),
            );
          } else {
            //todo: success
            return SourceTabWidget(
              sourceList: viewModel.sourcesList!,
              category: widget.category,
            );
          }
        },
      ),
      // FutureBuilder(
      //   future: ApisManager.getSources(widget.category.id),
      //     builder: (context, snapshot) {
      //       //todo: loading
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.grey,
      //           ),
      //         );
      //       }
      //       //todo: error => client
      //       else if (snapshot.hasError) {
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
      //                 ApisManager.getSources(widget.category.id);
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
      //       //todo: serverResponse => Error
      //       if(snapshot.data?.status != 'ok'){
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!,
      //               style: Theme.of(context).textTheme.labelMedium,),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: AppColors.grey
      //               ),
      //               onPressed: (){
      //                 ApisManager.getSources(widget.category.id);
      //               setState(() {
      //
      //               });
      //             },
      //               child: Text(AppLocalizations.of(context)!.please_try_again,
      //                 style: Theme.of(context).textTheme.labelMedium,),)
      //           ],
      //         );
      //       }
      //       //todo: serverResponse => Success
      //       var sourceList = snapshot.data?.sources ?? [];
      //       return SourceTabWidget(
      //         sourceList: sourceList, category: widget.category,);
      //
      //
      //
      //     },),
    );
  }
}
