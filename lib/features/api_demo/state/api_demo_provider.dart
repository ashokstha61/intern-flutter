import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_api_service.dart';

final mockApiServiceProvider = Provider((ref) => MockApiService());

final postsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  final service = ref.read(mockApiServiceProvider);
  return service.fetchPosts();
});

final postDetailProvider =
    FutureProvider.autoDispose.family<Post, int>((ref, postId) async {
  final service = ref.read(mockApiServiceProvider);
  return service.fetchPostById(postId);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedPostsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final service = ref.read(mockApiServiceProvider);
  
  if (query.isEmpty) {
    return service.fetchPosts();
  }
  
  return service.searchPosts(query);
});