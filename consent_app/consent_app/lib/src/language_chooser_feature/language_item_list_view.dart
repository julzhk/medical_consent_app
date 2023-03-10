import 'package:consent_app/src/video_player_feature/video_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

import '../../main.dart';
import '../components/frame.dart';
import '../components/horizontal_chooser.dart';
import 'language_dataclass.dart';

onTap(language, store, context) {
  print('clik2');
  store.language = language.code;
  I18n.of(context).locale = Locale(language.code);
  Navigator.restorablePushNamed(
    context,
    VideoItemDetailsView.routeName,
    arguments: 0,
  );
}

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
    Store store = locator<Store>();
    return FrameView(
        heading: 'Choose Language',
        body:
          horizontalChooser(languages, store, context, onTap)
    );
  }
}
