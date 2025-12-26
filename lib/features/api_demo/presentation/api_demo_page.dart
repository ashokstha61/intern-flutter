import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/features/api_demo/presentation/postslist.dart';
import 'package:projectintern/features/api_demo/presentation/widgets/errorwidget.dart';
import 'package:projectintern/features/api_demo/presentation/widgets/shimerloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../state/api_demo_provider.dart';

class ApiDemoPage extends ConsumerStatefulWidget {
  const ApiDemoPage({super.key});

  @override
  ConsumerState<ApiDemoPage> createState() => _ApiDemoPageState();
}

class _ApiDemoPageState extends ConsumerState<ApiDemoPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final postsAsync = ref.watch(searchedPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Data with Riverpod'),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Beamer.of(context).beamBack(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search posts...',
                prefixIcon: const Icon(FontAwesomeIcons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(FontAwesomeIcons.times),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(searchQueryProvider.notifier).state = '';
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
          Expanded(
            child: postsAsync.when(
              data: (posts) => PostsListView(posts: posts),
              loading: () => const LoadingShimmer(),
              error: (error, stackTrace) => ErrorsWidget(
                error: error.toString(),
                onRetry: () => ref.invalidate(searchedPostsProvider),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.invalidate(searchedPostsProvider),
        child: const Icon(FontAwesomeIcons.arrowsRotate),
      ),
    );
  }
}
