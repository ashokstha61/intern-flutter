import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:projectintern/features/api_demo/presentation/postdetails.dart';

class PostsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        '/posts/:postId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final postId = int.parse(state.pathParameters['postId']!);

    return [
      BeamPage(
        key: ValueKey('post-$postId'),
        title: 'Post Details',
        child: PostDetailPage(postId: postId),
      ),
    ];
  }
}
