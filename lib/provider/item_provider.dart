import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:faker/faker.dart';
import '../features/forms/state/form_provider.dart';

final itemsProvider = StateNotifierProvider<ItemsNotifier, List<Item>>(
  (ref) => ItemsNotifier(),
);

class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super(_generateInitialItems());

  static List<Item> _generateInitialItems() {
    final faker = Faker();
    return List.generate(5, (index) {
      return Item(
        id: faker.guid.guid(),
        title: faker.lorem.sentence(),
        description: faker.lorem.sentences(3).join(' '),
        price: faker.randomGenerator.decimal(scale: 100, min: 10),
        category: faker.food.cuisine(),
        createdAt: faker.date.dateTime(minYear: 2023, maxYear: 2024),
        imageUrl: 'https://picsum.photos/400/300?random=${index + 100}',
      );
    });
  }

  void addItem(Item item) {
    state = [...state, item];
  }

  void updateItem(String id, Item updatedItem) {
    state = state.map((item) => item.id == id ? updatedItem : item).toList();
  }

  void deleteItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void clearAll() {
    state = [];
  }

  List<Item> searchItems(String query) {
    if (query.isEmpty) return state;
    
    return state.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase()) ||
          item.description.toLowerCase().contains(query.toLowerCase()) ||
          item.category.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<Item> getByCategory(String category) {
    return state.where((item) => item.category == category).toList();
  }

  List<String> getCategories() {
    return state.map((item) => item.category).toSet().toList();
  }

  double get totalValue {
    return state.fold(0, (sum, item) => sum + item.price);
  }
}