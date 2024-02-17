import 'package:flutter/cupertino.dart';

import 'custom_auto_complete_search.dart';

class CustomSearchBarController extends ChangeNotifier {
  late CustomAutoCompleteSearchState _autoCompleteSearch;

  attach(CustomAutoCompleteSearchState searchWidget) {
    _autoCompleteSearch = searchWidget;
  }

  /// Just clears text.
  clear() {
    _autoCompleteSearch.clearText();
  }

  /// Clear and remove focus (Dismiss keyboard)
  reset() {
    _autoCompleteSearch.resetSearchBar();
  }

  clearOverlay() {
    _autoCompleteSearch.clearOverlay();
  }
}
