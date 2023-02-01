import 'package:consent_app/src/procedure_chooser_feature/procedure_item_list_view.dart';
import 'package:consent_app/src/video_player_feature/video_item_details_view.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../procedure_data.dart';
import '../settings/settings_view.dart';
import '../video_player_feature/video_item_list_view.dart';
import 'language_dataclass.dart';

class LanguageListView extends StatelessWidget {
  const LanguageListView({
    super.key,
    this.languages = content,
  });

  static const content = LanguageData.data;
  static const routeName = '/LanguageListView';

  final List<Language> languages;

  @override
  Widget build(BuildContext context) {
    const procedures = ProcedureData.data;
    var first_procedure = procedures.first;
    Store store = locator<Store>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Language'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'LanguageListView',
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          final language = languages[index];

          return ListTile(
              title: Text('Language: ${language.name}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  VideoItemDetailsView.routeName,
                  arguments: first_procedure.id,
                );
              });
        },
      ),
    );
  }
}
