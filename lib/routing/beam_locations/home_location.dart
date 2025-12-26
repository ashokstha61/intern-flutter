import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/counter/presentation/counter_page.dart';
import '../../features/api_demo/presentation/api_demo_page.dart';
import '../../features/forms/presentation/add_item_form.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/',
        '/home',
        '/counter',
        '/api-demo',
        '/add-item',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = <BeamPage>[];

    if (state.uri.path == '/' || state.uri.path == '/home') {
      pages.add(
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomePage(),
        ),
      );
    }

    if (state.uri.path == '/counter') {
      pages.add(
        const BeamPage(
          key: ValueKey('counter'),
          title: 'Counter',
          child: CounterPage(),
        ),
      );
    }

    if (state.uri.path == '/api-demo') {
      pages.add(
        const BeamPage(
          key: ValueKey('api-demo'),
          title: 'Async Demo',
          child: ApiDemoPage(),
        ),
      );
    }

    if (state.uri.path == '/add-item') {
      pages.add(
        const BeamPage(
          key: ValueKey('add-item'),
          title: 'Add Item',
          child: AddItemFormPage(),
        ),
      );
    }

    return pages;
  }
}