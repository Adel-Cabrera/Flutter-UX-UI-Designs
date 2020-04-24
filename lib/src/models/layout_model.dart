import 'package:flutter/widgets.dart';
import 'package:flutterexuxuii/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget value) {
    _currentPage = value;
    notifyListeners();
  }
}
