import 'package:flutter/cupertino.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.title, required this.id, required this.image});

  /*
business  entertainment  general  health  science  sports  technology
 */
  static List<Category> getCategoryList(BuildContext context) {
    return [
      Category(
        title: AppLocalizations.of(context)!.general,
        id: 'general',
        image: AppAssets.generalImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.business,
        id: 'business',
        image: AppAssets.businessImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.entertainment,
        id: 'entertainment',
        image: AppAssets.entertainmentImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.health,
        id: 'health',
        image: AppAssets.healthImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.science,
        id: 'science',
        image: AppAssets.scienceImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.technology,
        id: 'technology',
        image: AppAssets.technologyImage,
      ),
      Category(
        title: AppLocalizations.of(context)!.sports,
        id: 'sports',
        image: AppAssets.sportsImage,
      ),
    ];
  }
}
