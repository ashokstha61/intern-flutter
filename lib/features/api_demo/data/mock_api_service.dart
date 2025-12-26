import 'dart:convert';
import 'package:faker/faker.dart';
import 'package:flutter/services.dart';

class Post {
  final int id;
  final String title;
  final String body;
  final String author;
  final DateTime date;
  final String imageUrl;
  final int likes;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final faker = Faker();
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? faker.lorem.sentence(),
      body: json['body'] ?? faker.lorem.sentences(3).join('\n'),
      author: faker.person.name(),
      date: faker.date.dateTime(minYear: 2023, maxYear: 2024),
      imageUrl: 'https://picsum.photos/400/300?random=${json['id']}',
      likes: faker.randomGenerator.integer(1000),
    );
  }
}

class MockApiService {
  Future<List<Post>> fetchPosts() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Load mock data from JSON file
    final jsonString = await rootBundle.loadString('assets/mock_posts.json');
    final jsonData = json.decode(jsonString) as List;

    return jsonData.map((item) => Post.fromJson(item)).toList();
  }

  Future<Post> fetchPostById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    
    final faker = Faker();
    return Post(
      id: id,
      title: faker.lorem.sentence(),
      body: faker.lorem.sentences(5).join('\n'),
      author: faker.person.name(),
      date: faker.date.dateTime(minYear: 2023, maxYear: 2024),
      imageUrl: 'https://picsum.photos/600/400?random=$id',
      likes: faker.randomGenerator.integer(1000),
    );
  }

  Future<List<Post>> searchPosts(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final allPosts = await fetchPosts();
    return allPosts
        .where((post) =>
            post.title.toLowerCase().contains(query.toLowerCase()) ||
            post.body.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}