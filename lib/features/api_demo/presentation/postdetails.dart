import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectintern/features/api_demo/data/mock_api_service.dart';
import 'package:projectintern/features/api_demo/presentation/widgets/buildlearningpoint.dart';
import 'package:projectintern/features/api_demo/state/api_demo_provider.dart';

class PostDetailPage extends ConsumerWidget {
  final int postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postDetailProvider(postId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: postAsync.when(
        data: (post) => _PostDetailView(post: post),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class _PostDetailView extends StatelessWidget {
  final Post post;

  const _PostDetailView({required this.post});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'post-image-${post.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                post.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(
                  post.author[0],
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Published on ${post.date.day}/${post.date.month}/${post.date.year}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.red[400],
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${post.likes}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            post.body,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Learnings',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  buildLearningPoint(
                    'FutureProvider handles async state',
                    FontAwesomeIcons.bolt,
                  ),
                  buildLearningPoint(
                    'Auto-dispose removes unused providers',
                    FontAwesomeIcons.trash,
                  ),
                  buildLearningPoint(
                    'Provider families pass parameters',
                    FontAwesomeIcons.users,
                  ),
                  buildLearningPoint(
                    'Error states handled gracefully',
                    FontAwesomeIcons.exclamationCircle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}