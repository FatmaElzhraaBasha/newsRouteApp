import 'package:flutter/material.dart';
import 'package:news_route_app/l10n/app_localizations.dart';
import 'package:news_route_app/ui/category_details/category_details.dart';
import 'package:news_route_app/utils/app_assets.dart';
import 'package:news_route_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import '../../providers/app_Language_Provider.dart';
import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: CategoryDetails(),
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.19,
                vertical: height * 0.07,
              ),
              decoration: BoxDecoration(color: AppColors.white),
              child: Text(
                AppLocalizations.of(context)!.news_app,
                style: AppStyles.bold24Black,
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Row(
                    children: [
                      Image.asset(AppAssets.homeIcon),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.goto_home,
                          style: AppStyles.bold20White,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Divider(
                  endIndent: width * 0.04,
                  indent: width * 0.04,
                  color: AppColors.white,
                  height: 4,
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.themeIcon),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.theme,
                              style: AppStyles.bold20White,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.02),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: width * 0.02,
                        //   vertical: height * 0.01,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          title: Text(
                            themeProvider.isDarkMode()
                                ? AppLocalizations.of(context)!.dark
                                : AppLocalizations.of(context)!.light,
                            style: AppStyles.bold20White,
                          ),
                          collapsedIconColor: AppColors.white,
                          iconColor: AppColors.white,
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.01,
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.arrow_drop_up_outlined
                                : Icons.arrow_drop_down_outlined,
                            color: AppColors.white,
                            size: 35,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            InkWell(
                              onTap: () {
                                themeProvider.changeTheme(ThemeMode.light);
                              },
                              child: themeProvider.isDarkMode()
                                  ? getUnSelectedItem(
                                unSelectedText: AppLocalizations.of(
                                        context,
                                      )!.light,
                                    )
                                  : getSelectedItem(
                                selectedText: AppLocalizations.of(
                                        context,
                                      )!.light,
                                    ),
                            ),
                            SizedBox(height: height * 0.01),
                            InkWell(
                              onTap: () {
                                themeProvider.changeTheme(ThemeMode.dark);
                              },
                              child: themeProvider.isDarkMode()
                                  ? getSelectedItem(
                                selectedText: AppLocalizations.of(
                                        context,
                                      )!.dark,
                                    )
                                  : getUnSelectedItem(
                                unSelectedText: AppLocalizations.of(
                                        context,
                                      )!.dark,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Divider(
                  endIndent: width * 0.04,
                  indent: width * 0.04,
                  color: AppColors.white,
                  height: 4,
                ),
                SizedBox(height: height * 0.02),
                ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.languageIcon),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.language,
                              style: AppStyles.bold20White,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.02),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: width * 0.02,
                        //   vertical: height * 0.01,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          title: Text(
                            languageProvider.appLanguage == 'en'
                                ? AppLocalizations.of(context)!.english
                                : AppLocalizations.of(context)!.arabic,
                            style: AppStyles.bold20White,
                          ),
                          childrenPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.01,
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.arrow_drop_up_outlined
                                : Icons.arrow_drop_down_outlined,
                            color: AppColors.white,
                            size: 35,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            InkWell(
                              onTap: () {
                                languageProvider.changeLanguage('en');
                              },
                              child: languageProvider.appLanguage == 'en'
                                  ? getSelectedItem(
                                selectedText: AppLocalizations.of(
                                  context,
                                )!.english,
                              )
                                  : getUnSelectedItem(
                                unSelectedText: AppLocalizations.of(
                                  context,
                                )!.english,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            InkWell(
                              onTap: () {
                                languageProvider.changeLanguage('ar');
                              },
                              child: languageProvider.appLanguage == 'ar'
                                  ? getSelectedItem(
                                selectedText: AppLocalizations.of(
                                  context,
                                )!.arabic,
                              )
                                  : getUnSelectedItem(
                                unSelectedText: AppLocalizations.of(
                                  context,
                                )!.arabic,
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
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem({required String selectedText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selectedText, style: AppStyles.bold16White),
        Icon(Icons.check, color: AppColors.white, size: 35),
      ],
    );
  }

  Widget getUnSelectedItem({required String unSelectedText}) {
    return Row(
      children: [
        Text(unSelectedText, style: AppStyles.medium16White),
        Spacer(),
        SizedBox(width: 28),
      ],
    );
  }
}

/*
ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.themeIcon),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.theme,
                              style: AppStyles.bold20White,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.02),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                        child: InkWell(
                          onTap: () {
                            showThemeBottomSheet();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                themeProvider.isDarkMode()
                                    ? AppLocalizations.of(context)!.dark
                                    : AppLocalizations.of(context)!.light,
                                style: AppStyles.bold20White,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 35,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
 */


//b66f9f162dee4672857c79ab75aa4874
