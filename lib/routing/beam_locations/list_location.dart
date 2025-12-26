// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:projectintern/features/list/presentation/item_detail_page.dart';
// import 'package:projectintern/features/list/presentation/item_list_page.dart';

// class ListLocation extends BeamLocation<BeamState> {
//   @override
//   List<Pattern> get pathPatterns => ['/list', '/list/:id'];

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) {
//     final pages = <BeamPage>[];
    
//     // Always include the list page
//     pages.add(
//       BeamPage(
//         key: const ValueKey('list'),
//         title: 'Items List',
//         child: ItemsListPage(),
//       ),
//     );

//     // Handle item detail route
//     final id = state.pathParameters['id'];
//     if (id != null) {
//       pages.add(
//         BeamPage(
//           key: ValueKey('item-$id'),
//           title: 'Item Details',
//           child: ItemDetailPage(itemId: int.parse(id)),
//         ),
//       );
//     }

//     return pages;
//   }
// }


import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:projectintern/features/list/presentation/item_detail_page.dart';
import 'package:projectintern/features/list/presentation/item_list_page.dart';

class ListLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/list', '/list/:id'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = <BeamPage>[];
    
    pages.add(
      BeamPage(
        key: const ValueKey('list'),
        title: 'Items List',
        child: ItemsListPage(),
      ),
    );

    final id = state.pathParameters['id'];
    if (id != null) {
      pages.add(
        BeamPage(
          key: ValueKey('item-$id'),
          title: 'Item Details',
          child: ItemDetailPage(itemId: id),
        ),
      );
    }

    return pages;
  }
}



